-- The last room and building a customer went into in Hotel A? What time was associated with that?

SELECT 
    r.roomId,
    r.roomNumber,
    b.buildingName,
    cs.date,
    cs.time
FROM customer_scan AS cs
JOIN room AS r ON cs.cardReaderId = r.cardReaderId
JOIN wing AS w ON r.wingId = w.wingId
JOIN building AS b ON w.buildingId = b.buildingId
WHERE b.hotelId = 1 AND cs.readDirection = 'IN'
ORDER BY cs.date DESC, cs.time DESC
LIMIT 1;

-- Which customers have come back for multiple stays and how many stays?

SELECT customer.firstName, customer.lastName, COUNT(hotel_stay_record.customerId) AS stayCount
FROM customer
JOIN hotel_stay_record ON customer.customerId=hotel_stay_record.customerId
GROUP BY customer.firstName, customer.lastName
HAVING stayCount > 1;


-- Which sleeping reservation is not paid for yet?

SELECT sleepingReservationId
FROM total_bill
WHERE paymentDate IS NULL;

-- What is the peak time that meeting rooms are booked out for?

SELECT COUNT(startTime) AS mostCommonStart
FROM event_reservation
ORDER BY mostCommonStart DESC
LIMIT 1;


-- Which rooms in Building 1 are available?

SELECT 
    r.roomId,
    r.roomNumber,
    r.roomType,
    w.wingName
FROM room AS r
JOIN wing AS w ON r.wingId = w.wingId
JOIN room_status_record AS rsr ON r.roomId = rsr.roomId
WHERE w.buildingId = 1
AND rsr.statusType = 'Available'
AND rsr.endTime IS NULL;

-- What is the message left for customerId 7?

SELECT 
    gm.messageId,
    c.customerId,
    c.firstName,
    c.lastName,
    gm.messageType,
    gm.date,
    gm.time,
    gm.message
FROM guest_messages AS gm 
JOIN customer AS c ON gm.customerId = c.customerId
WHERE c.customerId = 7
ORDER BY gm.date DESC, gm.time DESC;

-- Which room in Building 2 is booked out the most often over quarter 1 of the year?
SELECT
    r.roomId,
    r.roomNumber,
    r.roomType,
    COUNT(ev_room.eventRoomId) AS bookedCount
FROM room AS r
JOIN wing AS w ON r.wingId = w.wingId
JOIN event_room AS ev_room ON r.roomId = ev_room.roomId
JOIN event AS e ON ev_room.eventId = e.eventId
JOIN event_reservation AS ev_res ON e.eventReservationId = ev_res.eventReservationId
WHERE w.buildingId = 2
AND ev_res.date BETWEEN '2026-01-01' AND '2026-03-31'
GROUP BY r.roomId, r.roomNumber, r.roomType
ORDER BY bookedCount DESC
LIMIT 1;

-- Are events or sleeping rooms reserved more often in Building 1?

SELECT 
    (
        SELECT COUNT(hsr.sleepingReservationId)
        FROM hotel_stay_record AS hsr
        JOIN room AS r ON hsr.roomId = r.roomId
        JOIN wing AS w ON r.wingId = w.wingId
        WHERE w.buildingId = 1
    ) AS sleepingRoomReservationCount,
    (
        SELECT COUNT(ev_room.eventId)
        FROM event_room AS ev_room
        JOIN room AS r ON ev_room.roomId = r.roomId
        JOIN wing AS w ON r.wingId = w.wingId
        WHERE w.buildingId = 1
    ) AS evenRoomtReservationCount;

