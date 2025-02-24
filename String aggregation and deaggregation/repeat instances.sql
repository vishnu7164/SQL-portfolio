CREATE TABLE repetition_input(
		input char(5),
        count int
);

INSERT INTO repetition_input VALUES
("V", 2),
("R",3),
("B",4);

SELECT *, repeat(input, count) as output 
FROM repetition_input