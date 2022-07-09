
-- @BLOCK

CREATE TABLE users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email varchar(255) NOT NULL UNIQUE,
    bio TEXT NOT NULL,
    cuuntry VARCHAR(2),
);

-- @BLOCK

INSERT INTO users(email, bio, cuuntry) 
VALUES
('amirt@gmail.com','my sql','us'),
('amirg@gmail.com','hi text', 'il'),
('lkin@mail.com', 'ts sql', 'uf');

-- @BLOCK
SELECT * FROM users;

-- @BLOCK
SELECT email, bio FROM users
ORDER BY email ASC
LIMIT 2;

-- @BLOCK
SELECT * FROM users
WHERE cuuntry = 'il' 
AND id > 3 OR id = 1;

-- @BLOCK
SELECT email FROM users
WHERE email LIKE 'am%';

-- @BLOCK
CREATE INDEX email_index ON users(email);

-- @BLOCK
CREATE TABLE rooms(
    id INTEGER AUTO_INCREMENT,
    street VARCHAR(255),
    owner_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (owner_id) REFERENCES users(id)
);

-- @BLOCK
INSERT INTO rooms(owner_id, street)
VALUES 
    (1, 'htg12'),
    (1, 'htg13'),
    (1, 'htg14'),
    (1, 'htg15'),
    (1, 'htg16');

-- @BLOCK
SELECT * FROM rooms;

-- @BLOCK
SELECT * FROM users
INNER JOIN rooms
on rooms.owner_id = users.id;

-- @BLOCK 
SELECT * FROM users
LEFT JOIN rooms
on rooms.owner_id = users.id;

-- @BLOCK
SELECT * FROM users
RIGHT JOIN rooms
on rooms.owner_id = users.id;

-- @BLOCK
SELECT * FROM users
FULL OUTER JOIN rooms
on rooms.owner_id = users.id;

-- @BLOCK
SELECT  
    user.id AS user_id,
    rooms.id AS rooms_id,
    email,
    bio,
FROM users
INNER JOIN rooms
on rooms.owner_id = users.id;

-- @BLOCK
CREATE TABLE bookings (
    id INT AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATETIME,
    PRIMARY KEY (id),
    FOREIGN KEY (room_id) REFERENCES rooms(id),
    FOREIGN KEY (guest_id) REFERENCES users(id)
);

-- @BLOCK
INSERT INTO bookings(guest_id, room_id)
VALUES 
    (1, 2),
    (3, 3),
    (3, 2),
    (2, 1),
    (2, 2);



-- @BLOCK
SELECT * FROM bookings
INNER JOIN rooms ON rooms.owner_id = guest_id
WHERE guest_id = 1;

-- @BLOCK
SELECT * FROM bookings
INNER JOIN users ON users.id = guest_id
WHERE room_id = 2;

-- @BLOCK
DROP TABLE bookings;
DROP DATABASE air;

