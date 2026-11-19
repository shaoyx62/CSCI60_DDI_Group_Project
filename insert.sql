PRAGMA foreign_keys = ON;

INSERT INTO hotel (hotelId, hotelName, address, city, state, zipCode, country, phoneNum)
VALUES (
    1, 'Last Resort Hotel', '32 Main Street', 'New York', 'New York', 10010, 'United States', '212-334-6097'
);

INSERT INTO building (buildingId, hotelId, buildingName)
VALUES 
    (1, 1, 'The Beach Building'),
    (2, 1, 'The Sea Building');

INSERT INTO wing (wingId, wingName, wingSequence, buildingId, accessibility, poolProximity, parkingProximity)
VALUES
    (1, 'North Wing', 1, 1, TRUE, 'Near', 'Medium'),
    (2, 'South Wing', 2, 1, TRUE, 'Far', 'Near'),
    (3, 'Garden Wing', 1, 2, FALSE, 'Near', 'Far');

INSERT INTO card_reader (cardReaderId)
VALUES
    (1001), (1002), (1003), (1004), (1005),
    (1006), (1007), (1008), (1009), (1010),
    (1011), (1012), (1013), (1014), (1015),
    (2001), (2002), (2003), (2004), (2005);

INSERT INTO room (roomId, roomNumber, parentRoomId, wingId, baseRentalRate, sleepingCapacity, seatingCapacity, toilet, smoking, roomType, cardReaderId)
VALUES
    (101, 'N101', NULL, 1, 149, 2, 2, 1, FALSE, 'Standard', 1001),
    (102, 'N102', NULL, 1, 189, 2, 2, 1, FALSE, 'Deluxe', 1002),
    (103, 'N201', NULL, 1, 349, 4, 4, 2, FALSE, 'Suite', 1003),
    (104, 'N201A', 103, 1, NULL, 2, 2, 1, FALSE, 'Suite Bedroom', NULL),
    (105, 'N201B', 103, 1, NULL, 2, 2, 1, FALSE, 'Suite Bedroom', NULL),
    (201, 'S101', NULL, 2, 179, 2, 2, 1, FALSE, 'Accessible', 1004),
    (202, 'S102', NULL, 2, 159, 2, 2, 1, TRUE, 'Standard', 1005),
    (301, 'G101', NULL, 3, 209, 2, 3, 1, FALSE, 'Deluxe', 1006),
    (106, 'N103', NULL, 1, 169, 2, 2, 1, FALSE, 'Standard', 1007),
    (107, 'N104', NULL, 1, 229, 2, 3, 1, FALSE, 'Deluxe', 1008),
    (203, 'S201', NULL, 2, 250, 0, 20, 1, FALSE, 'Meeting Room', 1009),
    (204, 'S202', NULL, 2, 200, 0, 12, 0, FALSE, 'Boardroom', 1010),
    (205, 'S203', NULL, 2, 550, 0, 72, 2, FALSE, 'Conference Room', 1011),
    (302, 'G102', NULL, 3, 320, 0, 32, 1, FALSE, 'Meeting Room', 1012),
    (303, 'G103', NULL, 3, 1500, 0, 300, 2, FALSE, 'Ballroom', 1013),
    (304, 'G103A', 303, 3, 800, 0, 150, 0, FALSE, 'Ballroom Section', 1014),
    (305, 'G103B', 303, 3, 800, 0, 150, 0, FALSE, 'Ballroom Section', 1015),
    (306, 'G104', NULL, 3, 650, 0, 100, 0, FALSE, 'Courtyard', NULL),
    (307, 'G105', NULL, 3, 420, 0, 60, 0, FALSE, 'Pool Patio', NULL);

INSERT INTO bed (bedId, bedSize, bedPlacement, quantity, roomId, bedType)
VALUES
    (1, 'Queen', 'Main Bedroom', 1, 101, 'Standard Bed'),
    (2, 'King', 'Main Bedroom', 1, 102, 'Standard Bed'),
    (3, 'Queen', 'Bedroom A', 1, 104, 'Standard Bed'),
    (5, 'Queen', 'Main Bedroom', 1, 201, 'Standard Bed'),
    (6, 'Queen', 'Main Bedroom', 1, 202, 'Standard Bed'),
    (7, 'King', 'Main Bedroom', 1, 301, 'Standard Bed'),
    (8, 'Queen', 'Main Bedroom', 1, 106, 'Standard Bed'),
    (9, 'King', 'Main Bedroom', 1, 107, 'Standard Bed');

INSERT INTO room_status_record (roomStatusId, roomId, statusType, startTime, endTime)
VALUES
    (1, 101, 'Available', '2026-01-01 00:00:00', NULL),
    (2, 102, 'Available', '2026-01-01 00:00:00', NULL),
    (3, 301, 'Out of Service', '2026-02-01 08:00:00', '2026-02-03 12:00:00'),
    (4, 301, 'Available', '2026-02-03 12:00:00', NULL),
    (5, 104, 'Occupied', '2026-01-14 15:00:00', '2026-01-20 11:00:00'),
    (6, 105, 'Occupied', '2026-01-14 15:00:00', '2026-01-20 11:00:00'),
    (7, 103, 'Occupied', '2026-01-15 15:00:00', '2026-01-18 11:00:00'),
    (8, 103, 'Occupied', '2026-02-15 15:00:00', '2026-02-20 11:00:00'),
    (9, 103, 'Occupied', '2026-02-22 15:00:00', '2026-02-24 11:00:00'),
    (10, 103, 'Occupied', '2026-03-05 15:00:00', '2026-03-06 11:00:00'),
    (11, 103, 'Occupied', '2026-03-23 15:00:00', '2026-03-25 11:00:00'),
    (12, 103, 'Available', '2026-03-25 11:00:00', NULL),
    (13, 106, 'Occupied', '2026-01-26 15:00:00', '2026-01-30 11:00:00'),
    (14, 106, 'Cleaning', '2026-01-30 11:00:00', '2026-01-30 13:00:00'),
    (15, 106, 'Available', '2026-01-30 13:00:00', NULL),
    (16, 107, 'Occupied', '2026-02-07 15:00:00', '2026-02-10 11:00:00'),
    (17, 202, 'Occupied', '2026-02-12 15:00:00', '2026-02-16 11:00:00'),
    (18, 201, 'Occupied', '2026-02-20 15:00:00', '2026-02-21 11:00:00'),
    (19, 201, 'Occupied', '2026-03-25 15:00:00', '2026-03-26 11:00:00'),
    (20, 201, 'Available', '2026-03-26 11:00:00', NULL),
    (21, 307, 'Occupied', '2026-01-01 09:15:00', '2026-01-01 12:30:00'),
    (22, 203, 'Occupied', '2026-01-04 13:00:00', '2026-01-04 18:00:00'),
    (23, 302, 'Occupied', '2026-01-04 13:00:00', '2026-01-04 18:00:00'),
    (24, 306, 'Occupied', '2026-01-15 09:00:00', '2026-01-15 12:00:00'),
    (25, 304, 'Occupied', '2026-01-15 09:00:00', '2026-01-15 12:00:00'),
    (26, 205, 'Occupied', '2026-01-15 18:00:00', '2026-01-15 20:00:00'),
    (27, 204, 'Occupied', '2026-02-03 15:00:00', '2026-02-03 21:00:00'),
    (28, 303, 'Occupied', '2026-03-09 17:45:00', '2026-03-09 20:15:00'),
    (29, 305, 'Available', '2026-01-01 00:00:00', '2026-03-09 17:45:00');

INSERT INTO room_adjacency (roomIdA, roomIdB, movableWall, privateAccess)
VALUES
    (101, 102, FALSE, TRUE),
    (104, 105, FALSE, FALSE),
    (106, 107, FALSE, TRUE),
    (201, 202, FALSE, TRUE),
    (202, 203, FALSE, FALSE),
    (203, 204, FALSE, FALSE),
    (304, 305, TRUE, FALSE);

INSERT INTO facility (facilityId, facilityType, location, buildingId, facilityName, cardReaderId, hotelId)
VALUES
    (1, 'Pool', 'Ground Floor', 1, 'Indoor Pool', 2001, 1),
    (2, 'Gym', 'Second Floor', 1, 'Fitness Center', 2002, 1),
    (3, 'Parking', 'Basement Level 1', 1, 'Underground Parking', NULL, 1),
    (4, 'Restaurant', 'Lobby', 2, 'Garden Bistro', 2003, 1),
    (5, 'Business Center', 'Lobby Level', 1, 'Business Center', NULL, 1),
    (6, 'Event Support', 'Ground Floor', 2, 'Event Foyer', NULL, 1);

INSERT INTO services (serviceId, serviceStandardPrice, serviceName, serviceCategory)
VALUES
    (1, 325, 'Full body massage', 'service'),
    (2, 50, 'Spa access', 'amenities'),
    (3, 50, 'Gym access', 'amenities'),
    (4, 50, 'Pool access', 'amenities'),
    (5, 10, 'Concierge', 'service'),
    (6, 10, 'Parking', 'amenities'),
    (7, 100, 'Personalized trainer', 'service'),
    (8, 10, 'Airport shuttle', 'service'),
    (9, 20, 'Laundry', 'service'),
    (10, 40, 'Hot tub access', 'amenities');

INSERT INTO organization (organizationId, organizationName, phoneNumber)
VALUES
    (1, 'Town Council', '212-854-2824'),
    (2, 'Tommy''s Tavern', '312-225-5506'),
    (3, 'Grandma''s Florist', '401-774-4257'),
    (4, 'NYC STEM Initiative', '646-450-4657'),
    (5, 'Metro Knitting Club', '207-933-9928'),
    (6, 'Manhattan Bingo Charity', '917-342-2679'),
    (7, 'Pulse Zumba Studio', '718-629-4611'),
    (8, 'Apex Networking Alliance', '201-892-9935'),
    (9, 'City Singles Socials', '512-359-4527'),
    (10, 'Hudson Valley Tech', '415-289-7912'),
    (11, 'Empire State Media', '310-548-5552'),
    (12, 'Liberty Legal Partners', '305-232-1488'),
    (13, 'Broadway Arts Guild', '406-914-7924'),
    (14, 'Tri-State Logistics', '617-295-4582'),
    (15, 'Beacon Hill Advisors', '205-206-3615'),
    (16, 'Silverline Ventures', '303-438-9279'),
    (17, 'Harborview Hospitality Group', '313-659-5557'),
    (18, 'Northstar Philanthropy', '206-816-1434');

INSERT INTO customer (customerId, firstName, lastName, customerType, phoneNumber, whereaboutConfidential, organizationId)
VALUES
    (1, 'Alice', 'Anderson', 'Guest', '206-234-4398', FALSE, NULL),
    (2, 'Benjamin', 'Brooks', 'Host', '207-834-9239', FALSE, 3),
    (3, 'Clara', 'Chen', 'Guest', '312-555-9234', FALSE, NULL),
    (4, 'Daniel', 'Davis', 'Host', '406-993-8349', FALSE, 5),
    (5, 'Elena', 'Evans', 'Host', '212-883-0145', FALSE, 6),
    (6, 'Felix', 'Foster', 'Host', '312-213-7349', FALSE, 1),
    (7, 'Grace', 'Garcia', 'Guest', '212-111-8387', TRUE, 1),
    (8, 'Henry', 'Harris', 'Guest', '617-545-7845', FALSE, NULL),
    (9, 'Iris', 'Ingram', 'Guest', '917-248-3554', FALSE, NULL),
    (10, 'Julian', 'Jenkins', 'Host', '312-646-3215', FALSE, 7),
    (11, 'Katherine', 'Kim', 'Guest', '205-543-3545', FALSE, NULL),
    (12, 'Liam', 'Lopez', 'Guest', '401-645-9845', TRUE, 11),
    (13, 'Maya', 'Mitchell', 'Host', '212-312-6543', FALSE, 8),
    (14, 'Nathan', 'Nelson', 'Guest', '646-884-3251', FALSE, 14),
    (15, 'Olivia', 'Owens', 'Host', '313-3545-3541', FALSE, 2),
    (16, 'Patrick', 'Patel', 'Host', '718-352-1132', FALSE, 10),
    (17, 'Quinn', 'Quintero', 'Host', '201-654-3215', FALSE, 9),
    (18, 'Rachel', 'Ramirez', 'Guest', '212-201-0158', TRUE, 11),
    (19, 'Samuel', 'Scott', 'Host', '303-452-3131', FALSE, 18),
    (20, 'Tessa', 'Taylor', 'Host', '305-775-9834', FALSE, 4),
    (21, 'Umar', 'Underwood', 'Billed Party', '212-555-0161', FALSE, NULL),
    (22, 'Victoria', 'Vance', 'Host', '415-555-0162', TRUE, NULL),
    (23, 'William', 'Walker', 'Host', '312-555-0163', FALSE, NULL),
    (24, 'Xavier', 'Xu', 'Host', '212-555-0164', FALSE, NULL),
    (25, 'Yasmin', 'Young', 'Guest', '917-555-0165', FALSE, NULL);

INSERT INTO customer_qualification (qualificationId, customerId, paidOnTime, flexibility, cooperativeness)
VALUES
    (1, 1, TRUE, 'High', 'High'),
    (2, 2, TRUE, 'Medium', 'High'),
    (3, 3, TRUE, 'High', 'High'),
    (4, 4, TRUE, 'High', 'Medium'),
    (5, 5, TRUE, 'Medium', 'High'),
    (6, 6, TRUE, 'Low', 'Medium'),
    (7, 7, TRUE, 'High', 'High'),
    (8, 9, TRUE, 'Medium', 'High'),
    (9, 10, TRUE, 'High', 'High'),
    (10, 11, FALSE, 'Low', 'Medium'),
    (11, 2, TRUE, 'Medium', 'High'),
    (12, 13, TRUE, 'High', 'High'),
    (13, 14, TRUE, 'Medium', 'Medium'),
    (14, 15, TRUE, 'High', 'High'),
    (15, 17, TRUE, 'High', 'Medium'),
    (16, 19, FALSE, 'Low', 'Low'),
    (17, 20, TRUE, 'High', 'High'),
    (18, 10, TRUE, 'Medium', 'High');

INSERT INTO guest_messages (messageId, messageType, message, date, time, customerId)
VALUES
    (1, 'Outgoing', 'In Town Council meetings in Garden Wing until 12:30 PM; available by phone after.', '2026-01-15', '08:50:00', 7),
    (2, 'Staff relay', 'Caller from City Hall asked Felix Foster to return call before noon.', '2026-01-15', '10:15:00', 6),
    (3, 'Outgoing', 'At the Indoor Pool until 11:00 AM, then heading to Garden Bistro for lunch.', '2026-01-16', '09:30:00', 9),
    (4, 'Outgoing', 'Teaching Zumba in Conference Room S203 until 8:00 PM; leave a message.', '2026-01-15', '14:10:00', 10),
    (5, 'Staff relay', 'Delivery driver arrived at Event Foyer for Tommy''s Tavern Team Meeting.', '2026-01-22', '09:50:00', 15),
    (6, 'Outgoing', 'Setting up STEM Fair booths on Pool Patio; reachable after 5:15 PM.', '2026-01-24', '13:40:00', 20),
    (7, 'Outgoing', 'Working in Business Center until 3:00 PM, then back in Room N104.', '2026-02-08', '11:20:00', 17),
    (8, 'Staff relay', 'Confidential guest Liam Lopez has a message from Empire State Media desk.', '2026-02-23', '14:05:00', 12),
    (9, 'Outgoing', 'Dining at Garden Bistro until 8:30 PM; urgent calls may be routed there.', '2026-02-14', '18:50:00', 2),
    (10, 'Outgoing', 'In the Fitness Center for morning workout until 8:45 AM.', '2026-02-16', '07:25:00', 14),
    (11, 'Outgoing', 'Attending Networking Day in Ballroom G103; back in room after 8:30 PM.', '2026-02-09', '17:40:00', 13),
    (12, 'Outgoing', 'Out sightseeing in Manhattan until 6:00 PM; please take a message.', '2026-03-05', '13:15:00', 1),
    (13, 'Staff relay', 'Confidential guest Rachel Ramirez received a courier envelope at front desk.', '2026-03-25', '16:10:00', 18),
    (14, 'Outgoing', 'In Boardroom S202 until 9:00 PM for Grandma''s Florist team session.', '2026-02-03', '14:55:00', 2),
    (15, 'Staff relay', 'Co-payer Umar Underwood called front desk regarding split bill #17.', '2026-03-14', '11:45:00', 11),
    (16, 'Outgoing', 'At Garden Bistro for breakfast until 9:30 AM before check-out.', '2026-02-21', '08:15:00', 6);

INSERT INTO customer_card (PIN, customerId)
VALUES
    (4821, 1), (7394, 2), (1956, 3), (8402, 4), (3167, 5),
    (9510, 6), (6284, 7), (2904, 5), (2749, 9), (5038, 10),
    (8192, 11), (3645, 12), (7013, 13), (4490, 14), (9276, 15),
    (2394, 16), (1583, 17), (6829, 18), (8239, 19), (5371, 20),
    (6142, 21), (7485, 22), (3918, 23), (8520, 24), (2905, 25);

INSERT INTO customer_scan (scanId, PIN, cardReaderId, date, time, readDirection)
VALUES
    (1, 6284, 1003, '2026-01-14', '16:05:00', 'IN'),
    (2, 6284, 1014, '2026-01-15', '08:55:00', 'IN'),
    (3, 6284, 1014, '2026-01-15', '12:05:00', 'OUT'),
    (4, 2749, 1006, '2026-01-15', '16:15:00', 'IN'),
    (5, 2749, 2001, '2026-01-16', '09:25:00', 'IN'),
    (6, 2749, 2001, '2026-01-16', '11:05:00', 'OUT'),
    (7, 5038, 1007, '2026-01-26', '16:10:00', 'IN'),
    (8, 5038, 2002, '2026-01-27', '07:45:00', 'IN'),
    (9, 5038, 2002, '2026-01-27', '09:00:00', 'OUT'),
    (10, 1583, 1008, '2026-02-07', '16:00:00', 'IN'),
    (11, 7394, 1005, '2026-02-13', '16:20:00', 'IN'),
    (12, 7394, 2003, '2026-02-14', '18:45:00', 'IN'),
    (13, 4490, 1003, '2026-02-15', '16:12:00', 'IN'),
    (14, 9510, 1004, '2026-02-20', '16:05:00', 'IN'),
    (15, 3645, 1003, '2026-02-23', '16:30:00', 'IN'),
    (16, 4821, 1003, '2026-03-05', '16:08:00', 'IN'),
    (17, 5038, 1001, '2026-03-23', '16:15:00', 'IN'),
    (18, 2905, 1004, '2026-03-25', '16:02:00', 'IN');

INSERT INTO event_reservation (roomQuantity, date, startTime, endTime, minSeating, customerId, estimatedGuests, hotelId, facilityId)
VALUES
    (1, '2026-01-01', '9:15 AM', '12:30 PM', 50, 1, 60, 1, 4),
    (2, '2026-01-04', '1:00 PM', '6:00 PM', 50, 5, 40, 1, 6),
    (1, '2026-01-08', '5:00 PM', '10:00 PM', 30, 4, 30, 1, 6),
    (2, '2026-01-15', '9:00 AM', '12:00 PM', 50, 6, 200, 1, 6),
    (1, '2026-01-15', '6:00 PM', '8:00 PM', 20, 10, 50, 1, 2),
    (1, '2026-01-22', '10:00 AM', '2:15 PM', 20, 15, 20, 1, 5),
    (1, '2026-01-24', '2:00 PM', '5:00 PM', 20, 20, 40, 1, 5),
    (1, '2026-01-29', '1:30 PM', '3:45 PM', 30, 19, 30, 1, 4),
    (1, '2026-02-01', '2:00 PM', '4:00 PM', 20, 17, 45, 1, 4),
    (1, '2026-02-03', '3:00 PM', '9:00 PM', 10, 2, 10, 1, 3),
    (1, '2026-02-08', '3:30 PM', '8:30 PM', 30, 6, 30, 1, 6),
    (1, '2026-03-09', '5:45 PM', '8:15 PM', 35, 13, 250, 1, 6),
    (1, '2026-02-10', '6:00 PM', '7:30 PM', 30, 25, 30, 1, 4),
    (2, '2026-02-14', '7:00 PM', '9:00 PM', 45, 24, 130, 1, 4);

INSERT INTO event (eventId, eventName, eventReservationId)
VALUES
    (1, 'New Year''s Day Breakfast', 1),
    (2, 'Bingo Fundraiser', 2),
    (3, 'Knitting Club', 3),
    (4, 'Town Council', 4),
    (5, 'Zumba Class', 5),
    (6, 'Tommy''s Tavern Team Meeting', 6),
    (7, 'STEM Fair', 7),
    (8, 'Bingo Fundraiser', 8),
    (9, 'Speed Dating', 9),
    (10, 'Grandma''s Florist Team Meeting', 10),
    (11, 'Town Council', 11),
    (12, 'Networking Day', 12),
    (13, 'Galentine''s Day Fun', 13),
    (14, 'Valentine''s Day Celebration', 14);

INSERT INTO event_room (eventId, roomId)
VALUES
    (1, 307),
    (2, 203),
    (2, 302),
    (3, 302),
    (4, 306),
    (4, 304),
    (5, 205),
    (6, 203),
    (7, 307),
    (8, 302),
    (9, 205),
    (10, 204),
    (11, 302),
    (12, 303),
    (13, 302),
    (14, 205),
    (14, 307);

INSERT INTO sleeping_reservation (sleepingReservationId, customerId, hotelId, expectedCheckIn, expectedCheckOut, numGuests, bedType, smokingPreference, accessibility, bookingDate, reservationStatus, eventReservationId)
VALUES
    (1, 7, 1, '2026-01-05', '2026-01-07', 2, 'king', FALSE, FALSE, '2025-12-26', 'fulfilled', NULL),
    (2, 3, 1, '2026-01-13', '2026-01-20', 4, 'double queen', FALSE, FALSE, '2026-01-02', 'fulfilled', NULL),
    (3, 7, 1, '2026-01-14', '2026-01-20', 1, 'king', FALSE, FALSE, '2026-01-01', 'fulfilled', 4),
    (4, 9, 1, '2026-01-15', '2026-01-18', 3, 'double queen', FALSE, FALSE, '2026-01-03', 'fulfilled', NULL),
    (5, 10, 1, '2026-01-26', '2026-01-30', 2, 'king', FALSE, FALSE, '2026-01-15', 'fulfilled', NULL),
    (6, 17, 1, '2026-02-07', '2026-02-10', 2, 'king', FALSE, FALSE, '2026-01-25', 'fulfilled', NULL),
    (7, 1, 1, '2026-03-05', '2026-03-06', 4, 'double queen', FALSE, FALSE, '2026-01-26', 'fulfilled', NULL),
    (8, 2, 1, '2026-02-12', '2026-02-16', 1, 'king', TRUE, FALSE, '2026-01-27', 'fulfilled', 14),
    (9, 6, 1, '2026-02-20', '2026-02-21', 2, 'king', FALSE, TRUE, '2026-01-29', 'fulfilled', NULL),
    (10, 14, 1, '2026-02-15', '2026-02-20', 2, 'king', FALSE, FALSE, '2026-02-01', 'fulfilled', NULL),
    (11, 12, 1, '2026-02-22', '2026-02-24', 4, 'double queen', FALSE, FALSE, '2026-02-07', 'assigned', NULL),
    (12, 10, 1, '2026-03-23', '2026-03-25', 4, 'double queen', FALSE, FALSE, '2026-02-15', 'assigned', NULL),
    (13, 11, 1, '2026-03-14', '2026-03-17', 3, 'double queen', TRUE, FALSE, '2026-02-25', 'assigned', NULL),
    (14, 18, 1, '2026-03-25', '2026-03-27', 1, 'full', TRUE, FALSE, '2026-02-28', 'in use', NULL),
    (15, 25, 1, '2026-03-25', '2026-03-26', 2, 'king', FALSE, TRUE, '2026-03-04', 'in use', NULL);

INSERT INTO hotel_stay_record (stayId, customerId, roomId, sleepingReservationId, checkIn, checkOut)
VALUES
    (1001, 7, 104, 3, '2026-01-14', '2026-01-20'),
    (1002, 9, 103, 4, '2026-01-15', '2026-01-18'),
    (1003, 10, 106, 5, '2026-01-26', '2026-01-30'),
    (1004, 17, 107, 6, '2026-02-07', '2026-02-10'),
    (1005, 1, 103, 7, '2026-03-05', '2026-03-06'),
    (1006, 2, 202, 8, '2026-02-12', '2026-02-16'),
    (1007, 6, 201, 9, '2026-02-20', '2026-02-21'),
    (1008, 14, 103, 10, '2026-02-15', '2026-02-20'),
    (1009, 12, 103, 11, '2026-02-22', '2026-02-24'),
    (1010, 10, 103, 12, '2026-03-23', '2026-03-25'),
    (1011, 25, 201, 15, '2026-03-25', '2026-03-26');

INSERT INTO total_bill (billId, amountPaid, paymentDate, eventReservationId, sleepingReservationId)
VALUES
    (4, 1000, '2026-01-05', 3, NULL),
    (5, 2100, '2026-01-08', 4, NULL),
    (6, 1500, NULL, 5, NULL),
    (7, 700, '2026-01-12', 6, NULL),
    (8, 800, '2026-01-15', 7, NULL),
    (9, 1000, '2026-01-17', 8, NULL),
    (10, 500, '2026-01-22', NULL, 6),
    (11, 450, '2026-01-23', NULL, 7),
    (12, 300, NULL, NULL, 8),
    (13, 500, '2026-01-24', NULL, 9),
    (14, 200, '2026-01-24', NULL, 10),
    (15, 350, NULL, NULL, 11),
    (16, 250, '2026-01-30', NULL, 12),
    (17, 300, NULL, NULL, 13);

INSERT INTO billed_party (billedPartyId, customerId, organizationId, paymentInformation, billingAddress, splittingPercentage, splitCharges, billId)
VALUES
    (1, 4, NULL, '4032037695905394', '869 Hosler Lane, Montana', NULL, NULL, 4),
    (2, 6, NULL, '4032038919168140', '704 Lowe Rd, Illinois', NULL, NULL, 5),
    (3, 10, NULL, '4032034368698802', '312 Main St, Illinois', NULL, NULL, 6),
    (4, 15, NULL, '4032031227853925', '2822 E Veterans Memorial Blvd, Michigan', NULL, NULL, 7),
    (5, 20, NULL, '4032031269055744', '4887 Alpha Rd, Florida', NULL, NULL, 8),
    (6, 19, NULL, '4032039754978403', '4301 N Mesa St, Ste 104, Colorado', NULL, NULL, 9),
    (7, 17, NULL, '4032039272905417', '6515 E Meadowlark Ln, New Jersey', NULL, NULL, 10),
    (8, 1, NULL, '4032037034317194', '3944 Lincoln Street, Washington', NULL, NULL, 11),
    (9, 2, NULL, '3749607437067189', '3305 Grape Rd Ste 3, Maine', NULL, NULL, 12),
    (10, 6, NULL, '4032038919168140', '704 Lowe Rd, Illinois', NULL, NULL, 13),
    (11, 20, NULL, '4032031269055744', '4887 Alpha Rd, Florida', NULL, NULL, 14),
    (12, 12, NULL, '6011318817135395', '1500 N Wilmot Rd, Ste 180, Rhode Island', NULL, NULL, 15),
    (13, 10, NULL, '4032034368698802', '312 Main St, Illinois', NULL, NULL, 16),
    (14, 11, NULL, '6011859878694457', '300 Huey P Long Ave, # 2B, Alabama', 50, NULL, 17),
    (15, 21, NULL, '6011525171588924', '1679 3RD Ave, New York', 50, NULL, 17);

INSERT INTO service_charges (serviceTransactionId, serviceId, billId, chargeAmount, transactionTransmittalForm, discount)
VALUES
    (1001, 6, 6, 10, 101, NULL),
    (1002, 2, 4, 50, 102, NULL),
    (1003, 10, 4, 40, 103, NULL),
    (1004, 6, 10, 10, 104, NULL),
    (1005, 8, 12, 10, 105, NULL),
    (1006, 6, 15, 10, 106, NULL),
    (1007, 2, 8, 45, 107, 10),
    (1008, 1, 9, 260, 108, 20),
    (1009, 6, 16, 10, 109, NULL);
