-- Kaylee's Query
-- 1 - (a). Stored Procedure (updating data)
-- UpdtdRating updates the rating for specific Customer_Id, and inserts a new rating on a designated
-- Customer_Id. There are five parameters to insert when executing which is the Customer_Id for updated rating,
-- new rating score for updated rating, and (new Customer_Id, new Content_Id, new Rating_Score) for inserting new data
CREATE PROCEDURE UpdtdRating
    @UpdateCustomer_Id INT,
    @UpdateRating_Score DECIMAL(3, 2), 
    @NewCustomer_Id INT,
    @NewContent_Id INT,
    @NewRating_Score DECIMAL(3, 2)
AS
BEGIN
    -- Update the rating for specific Customer_Id
    UPDATE Rating
    SET Rating_Score = @UpdateRating_Score
    WHERE Customer_Id = @UpdateCustomer_Id;

    -- Insert a new rating
    INSERT INTO Rating (Customer_Id, Content_Id, Rating_Score)
    VALUES (@NewCustomer_Id, @NewContent_Id, @NewRating_Score);
END;
GO

-- Execute example for UpdtdRating
EXEC UpdtdRating 
    @UpdateCustomer_Id = 3,
    @UpdateRating_Score = 9.80,
    @NewCustomer_Id = 11,
    @NewContent_Id = 20,
    @NewRating_Score = 8.6;
GO

-- 1 - (b). Stored Procedure (deleting a row of data)
-- Stored procedure DelRating takes in Rating_Id as parameter and deletes the specified row
-- with the Rating_Id inserted when executed.
CREATE PROCEDURE DelRating
    @Rating_Id INT
AS
BEGIN
    -- Delete the row with the specified Rating_Id
    DELETE FROM Rating
    WHERE Rating_Id = @Rating_Id;

END;
GO

-- Execute example for DelRating
EXEC UpdtdRating 
    @Rating_Id = 3;
GO

-- 1 - (c). triggers (log update operations of your update stored procedure)

-- Create the log table to store information, where triggers can insert data.
-- The table will capture details like operation type, timestamp, and other relevant info,
CREATE TABLE RatingLog (
    Log_Id INT IDENTITY PRIMARY KEY,
    OperationType NVARCHAR(50),
    Customer_Id INT,
    Content_Id INT,
    Old_Rating_Score DECIMAL(3, 2),
    New_Rating_Score DECIMAL(3, 2),
    OperationDateTime DATETIME DEFAULT GETDATE()
);
GO

-- Creating the update trigger: this will execute whenever an update occurs on the Rating table, logging
-- the changes to the RatingLog table
CREATE TRIGGER trg_Rating_Update
ON Rating
AFTER UPDATE
AS
BEGIN
    INSERT INTO RatingLog (OperationType, Customer_Id, Content_Id, Old_Rating_Score, New_Rating_Score)
    SELECT 'UPDATE', i.Customer_Id, i.Content_Id, d.Rating_Score AS Old_Rating_Score, i.Rating_Score AS New_Rating_Score
    FROM inserted i
    INNER JOIN deleted d ON i.Rating_Id = d.Rating_Id;
END;
GO

-- 1 - (d). triggers (log delete operations of your deleted stored procedure)
-- This will executre whenever a delete occurs on the Rating table, logging the details
-- of the deleted row in the RatingLog table.
CREATE TRIGGER trg_Rating_Delete
ON Rating
AFTER DELETE
AS
BEGIN
    INSERT INTO RatingLog (OperationType, Customer_Id, Content_Id, Old_Rating_Score)
    SELECT 'DELETE', d.Customer_Id, d.Content_Id, d.Rating_Score AS Old_Rating_Score, NULL AS New_Rating_Score
    FROM deleted d;
END;
GO

-- 2. Write the SQL code to create one trigger that implements a business logic or business rule.
-- This trigger will prevent users from submitting a rating below a specified minimum for content marked as “kid-friendly.”
-- If a user tries to rate kid-friendly PG-13 content below the minimum rating (for example 5.0), the trigger will roll back the 
-- transaction, ensuring that the rating is not saved. This trigger could prevent the rating from being set too low. 
-- This would help ensure that kid-appropriate content is not unfairly rated, preserving its appeal and satisfying the business 
-- logic of Netflix including data accuracy, content management, and user experience.
CREATE TRIGGER trg_EnforceMinRatingForKidsContent
ON Rating
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @Content_Id INT;
    DECLARE @Customer_Id INT;
    DECLARE @Rating_Score DECIMAL(3, 2);
    DECLARE @Content_Maturity NVARCHAR(50);
    DECLARE @MinRating DECIMAL(3, 2) = 5.0;

    SELECT @Content_Id = i.Content_Id, @Customer_Id = i.Customer_Id, @Rating_Score = i.Rating_Score
    FROM inserted i;

    SELECT @Content_Maturity = c.Content_Maturity
    FROM dbo.Content c
    WHERE c.Content_Id = @Content_Id;

    IF @Content_Maturity = 'PG-13' AND @Rating_Score < @MinRating
    BEGIN
        RAISERROR('Rating for kid-friendly content cannot be below %f', 16, 1, @MinRating);
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        INSERT INTO Rating (Customer_Id, Content_Id, Rating_Score)
        VALUES (@Customer_Id, @Content_Id, @Rating_Score);
    END
END;
GO

-- result examples for question 2...
-- this would succeed since content id 3 with content maturity PG-13 has rating larger than 5.0
INSERT INTO Rating (Customer_Id, Content_Id, Rating_Score)
VALUES (1, 3, 6.5); -- Content_Id 3 is kid-appropriate with rating of 9.10 in the data table, but this is an example to show results of the following trigger

-- this will fail since content id 3 with content maturity PG-13 has rating smaller than 5.0
INSERT INTO Rating (Customer_Id, Content_Id, Rating_Score)
VALUES (1, 3, 4.0);

-- 3. Write the SQL code to create 2 difference complex queries. One of these quries should 
-- use a stored prodecure that takes given inputs and returns expected output. 

-- 3 - (a). This is a query to get trending content based on watch time and ratings.
-- I set a threshold for trending hours as more than 1 hour and high ratings as higher than 8.0.
-- This could calculate the most-watched and highest-rated content over the past 30 days to help Netflix identify trending shows or movies.
SELECT c.Content_Id, c.Content_Maturity, c.Content_Genre,
    SUM(DATEDIFF(MINUTE, '00:00:00', cw.Stop_Time)) / 60.0 AS Total_Hours_Watched,
    AVG(r.Rating_Score) AS Average_Rating
FROM dbo.Content c
JOIN Currently_Watching cw ON c.Content_Id = cw.Content_Id
LEFT JOIN Rating r ON c.Content_Id = r.Content_Id
WHERE cw.Date_Watched >= DATEADD(DAY, -30, GETDATE())
GROUP BY c.Content_Id, c.Content_Maturity, c.Content_Genre
HAVING SUM(DATEDIFF(MINUTE, '00:00:00', cw.Stop_Time)) / 60.0 > 1
    AND AVG(r.Rating_Score) >= 8.0
ORDER BY Total_Hours_Watched DESC, Average_Rating DESC;

-- 3 - (b). This is stored procedure to retrieve user engagement for a given content:
-- The stored procedure takes Content_Id and a date range as inputs and returns detailed information about 
-- user engagement for that content within the specified period. 
-- This procedure could calculate total watch time, unique viewers, and average session time.
GO
CREATE PROCEDURE GetUserEngagementForContent
    @Content_Id INT,
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SELECT cw.Content_Id, c.Content_Maturity, c.Content_Genre, COUNT(DISTINCT cw.Customer_Id) AS Unique_Viewers,
        SUM(DATEDIFF(MINUTE, '00:00:00', cw.Stop_Time)) / 60.0 AS Total_Hours_Watched,
        AVG(DATEDIFF(MINUTE, '00:00:00', cw.Stop_Time)) / 60.0 AS Average_Session_Hours
    FROM Currently_Watching cw
    JOIN Content c ON cw.Content_Id = c.Content_Id
    WHERE cw.Content_Id = @Content_Id AND cw.Date_Watched BETWEEN @StartDate AND @EndDate
    GROUP BY cw.Content_Id, c.Content_Maturity, c.Content_Genre;
END;

-- Daisy's Query
-- Stored Procedure to Update
/* In this Stored Procedure, it uses a current customer and content id from Watch History
   to then go in and update with a new customer, content id, and date watched */
GO
CREATE OR AlTER PROCEDURE insert_Watch_History
   (@customer_id INT,
   @content_id INT,
   @new_customer_id INT,
   @new_content_id INT,
   @new_date_watched DATE)


AS
BEGIN


   UPDATE Watch_History
   SET Customer_Id = @new_customer_id, Content_Id = @new_content_id, Date_Watched = @new_date_watched
   WHERE Customer_Id = @customer_id AND Content_Id = @content_id;


   print 'New Watch History data updated successfully'


END
GO


EXEC insert_Watch_History 20, 17, 20, 17, '2023-03-10'


-- Stored Procedure to Delete
/* In this Stored Procedure, it deletes the row in Watch History based on
   the customer id that is being inputted. */
GO
CREATE OR ALTER PROCEDURE Delete_Watch_History
   (@customer_id INT,
   @content_id INT,
   @date_wached DATE)


AS
BEGIN


   -- SET NOCOUNT ON;
   DELETE FROM Watch_History WHERE Customer_Id = @customer_id;
   print 'New Watch History data deleted successfully'


END;


EXEC Delete_Watch_History 20, 19, '2023-03-10'




-- Trigger for Update
/* In this trigger, it creates a log for Watch History and adds a log
   either after an update or delete has been made */
CREATE TABLE Watch_History_Log (
   Log_Id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
   Operation_Type VARCHAR(10),
   Customer_Id INT,
   Content_Id INT,
   Date_Watched DATE
);




GO
CREATE OR ALTER TRIGGER log_updates
ON Watch_History
AFTER UPDATE


AS
BEGIN


   INSERT INTO Watch_History_Log (Operation_Type, Customer_Id, Content_Id, Date_Watched)
   SELECT 'UPDATE' AS Operation_Type, Customer_Id, Content_Id, Date_Watched
   FROM inserted;




END
GO


-- Trigger for Delete
CREATE OR ALTER TRIGGER log_deletes
ON Watch_History
AFTER DELETE


AS
BEGIN
  
   INSERT INTO Watch_History_Log (Operation_Type, Customer_Id, Content_Id, Date_Watched)
   SELECT 'DELETE' AS Operation_Type, Customer_Id, Content_Id, Date_Watched
   FROM deleted;




END
GO




SELECT *
FROM Watch_History_Log


-- Trigger with Business Logic
-- if rating higher than 8 than add to recommendations
/* In this trigger, if there is an insert into the Rating table
   where the Rating Score is at least 8, then it will add the
   corresponding values into the Recommendations table. */
GO
CREATE OR ALTER TRIGGER find_add_rating
ON Rating
AFTER INSERT


AS
BEGIN


   INSERT INTO Recommendation(Customer_Id, Content_Id, Trailer_Id)
   SELECT r.Customer_Id, r.Content_Id, t.Trailer_Id
   FROM inserted i
   JOIN Rating r ON i.Content_Id=r.Content_Id
   JOIN Trailer t ON i.Content_Id=t.Content_Id
   WHERE r.Rating_Score >= 8;


END




INSERT INTO Rating (Rating_Id, Customer_Id, Content_Id, Rating_Score)
VALUES (11, 11, 12, 8.9);  -- Adjust values as needed


-- Complex Queries
-- get recommendations based on content_id and rating_score and show customer who rates


GO
CREATE OR ALTER PROCEDURE get_recommendation
   (@content_id INT,
   @min_rating FLOAT)


AS
BEGIN
   IF EXISTS (
       SELECT 1
       FROM Recommendation r
       JOIN Rating ra ON r.Content_Id=ra.Content_Id
       WHERE Rating_Score >= @min_rating AND r.Content_Id = @content_id
   )


   BEGIN
       SELECT r.Customer_Id, r.Content_Id, Rating_Score
       FROM Recommendation r
       JOIN Rating ra ON r.Content_Id=ra.Content_Id
       WHERE Rating_Score >= @min_rating AND r.Content_Id = @content_id
       ORDER BY Rating_Score DESC;


       PRINT 'Found Recommendation Successfully';
   END
   ELSE
   BEGIN
       RAISERROR ('Recommendation not found' , 16, 1);
   END
END;
GO


EXEC get_recommendation 12, 9


-- Subquery
-- gets all the customers who have a basic subscription plan and finds all the
-- customers that are currently watching and watched specific genres


SELECT Customer_First_Name, cust.Customer_Id
FROM Customer cust
JOIN Subscription_Plan s ON cust.Subscription_Id=s.Subscription_Id
WHERE Plan_Type = 'Basic'
AND EXISTS(
   SELECT 1
   FROM Customer cust
   JOIN Watch_History w ON s.Customer_Id=w.Customer_Id
   JOIN Currently_Watching cw ON w.Customer_Id=cw.Customer_Id
   JOIN Content cont ON cw.Content_Id=cont.Content_Id
   WHERE w.Customer_Id=cust.Customer_Id AND
   cw.Customer_Id=cust.Customer_Id AND
   Content_Genre IN ('Drama', 'Animation', 'Adventure', 'Thriller', 'Sci-Fi', 'Mystery')
);


-- Tyler’s Querries
-- query 1: updates the customer email taking in the customer ID and email
GO
CREATE PROCEDURE UpdateCustomerEmail(
    @p_Customer_ID INT,
    @p_NewEmail VARCHAR(255)
)
AS
BEGIN
    UPDATE Customer
    SET Customer_Email = @p_NewEmail
    WHERE Customer_ID = @p_Customer_ID;
END;


-- query 2: updates the customer email taking in the customer ID and email
GO
CREATE PROCEDURE DeleteCustomer(
    @p_Customer_ID INT
)
AS
BEGIN
    DELETE FROM Customer
    WHERE Customer_ID = @p_Customer_ID;
END;




-- table for logging
CREATE TABLE CustomerUpdateLog (
Customer_Id INT IDENTITY PRIMARY KEY,
OldEmail NVARCHAR(50),
NewEmail NVARCHAR(50),
UpdateTime DATETIME DEFAULT GETDATE()
);



-- query 3: trigger that logs customer email changes
GO
CREATE OR ALTER TRIGGER LogUpdateCustomerEmail
ON Customer
AFTER UPDATE
AS
BEGIN
    INSERT INTO CustomerUpdateLog (Customer_Id, OldEmail, NewEmail)
    SELECT i.Customer_Id, d.Customer_Email AS OldEmail, i.Customer_Email AS NewEmail
    FROM inserted i
    JOIN deleted d ON i.Customer_Id = d.Customer_Id;
END;




-- query 4: trigger that logs customer deletions
GO
CREATE OR ALTER TRIGGER LogDeleteCustomer
ON Customer
AFTER DELETE
AS
BEGIN
    INSERT INTO CustomerUpdateLog (Customer_Id, OldEmail, NewEmail, UpdateTime)
    SELECT d.Customer_Id, d.Customer_Email AS OldEmail, NULL AS NewEmail, GETDATE()
    FROM deleted d;
END;

-- query 5: trigger that prevents the deletion of active customers ie those that have a subscription
GO
CREATE TRIGGER PreventDeleteActiveCustomer
ON Customer
INSTEAD OF DELETE
AS
BEGIN
    Select Subscription_expiriation_Date
    FROM Customer C
    JOIN Subscription_Plan s ON c.customer_ID = s.customer_ID
    IF Subscription_Expiration_Date >= GETDATE()
        AND Subscription_ID IS NOT NULL
    BEGIN
        RAISERROR('Cannot delete customer with active subscription', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;

-- query 6: Procedure that takes in a cast member and outputs all details for that castmember
GO
CREATE PROCEDURE GetCastMemberDetails(
    @p_Cast_ID INT
)
AS BEGIN
    SELECT Cast_first_name, Cast_last_name, Cast_List_ID, Cast_type
    FROM Cast_Member 
    WHERE Cast_ID = p_Cast_ID;
END;


-- query 7: table join that finds the content that customer 1 has within their watch history
SELECT c.Content_ID, c.Content_Genre, c.Content_Rating
FROM Watch_History wh
JOIN Content c ON wh.Content_ID = c.Content_ID
WHERE wh.Customer_ID = 1;