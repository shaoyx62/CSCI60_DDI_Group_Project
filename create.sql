PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS service_charges;
DROP TABLE IF EXISTS billed_party;
DROP TABLE IF EXISTS total_bill;
DROP TABLE IF EXISTS hotel_stay_record;
DROP TABLE IF EXISTS sleeping_reservation;
DROP TABLE IF EXISTS event_room;
DROP TABLE IF EXISTS event;
DROP TABLE IF EXISTS event_reservation;
DROP TABLE IF EXISTS services;
DROP TABLE IF EXISTS customer_scan;
DROP TABLE IF EXISTS customer_card;
DROP TABLE IF EXISTS guest_messages;
DROP TABLE IF EXISTS customer_qualification;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS organization;
DROP TABLE IF EXISTS facility;
DROP TABLE IF EXISTS room_adjacency;
DROP TABLE IF EXISTS room_status_record;
DROP TABLE IF EXISTS bed;
DROP TABLE IF EXISTS room;
DROP TABLE IF EXISTS wing;
DROP TABLE IF EXISTS card_reader;
DROP TABLE IF EXISTS building;
DROP TABLE IF EXISTS hotel;

-- Lauren: Hotel and building
CREATE TABLE hotel (
    hotelId INTEGER PRIMARY KEY,
    hotelName TEXT NOT NULL,
    address TEXT NOT NULL,
    city TEXT NOT NULL,
    state TEXT NOT NULL,
    zipCode INTEGER NOT NULL,
    country TEXT NOT NULL,
    phoneNum TEXT NOT NULL
);

CREATE TABLE building(
    buildingId INTEGER PRIMARY KEY,
    hotelId TEXT NOT NULL,
    buildingName TEXT NOT NULL,
    FOREIGN KEY (hotelId) REFERENCES hotel(hotelId)
);

-- Sua: Access control (put early because room/facility references it)
CREATE TABLE card_reader (
    cardReaderId INTEGER PRIMARY KEY
);

-- Isabelle: room infrastructure
CREATE TABLE wing (
    wingId INTEGER PRIMARY KEY,
    wingName TEXT NOT NULL,
    wingSequence INTEGER NOT NULL,
    buildingId INTEGER NOT NULL,
    accessibility BOOLEAN NOT NULL DEFAULT FALSE,
    poolProximity TEXT,
    parkingProximity TEXT
);

CREATE TABLE room (
    roomId INTEGER PRIMARY KEY,
    roomNumber TEXT NOT NULL,
    parentRoomId INTEGER,
    wingId INTEGER NOT NULL,
    baseRentalRate REAL,
    sleepingCapacity INTEGER NOT NULL,
    seatingCapacity INTEGER NOT NULL,
    toilet INTEGER NOT NULL,
    smoking BOOLEAN NOT NULL DEFAULT FALSE,
    roomType TEXT NOT NULL,
    cardReaderId INTEGER,
    FOREIGN KEY (parentRoomId) REFERENCES room(roomId),
    FOREIGN KEY (wingId) REFERENCES wing(wingId)
);

CREATE TABLE bed (
    bedId INTEGER PRIMARY KEY,
    bedSize TEXT NOT NULL,
    bedPlacement TEXT NOT NULL,
    quantity INTEGER NOT NULL,
    roomId INTEGER NOT NULL,
    bedType TEXT NOT NULL,
    FOREIGN KEY (roomId) REFERENCES room(roomId)
);

CREATE TABLE room_status_record (
    roomStatusId INTEGER PRIMARY KEY,
    roomId INTEGER NOT NULL,
    statusType TEXT NOT NULL,
    startTime TEXT NOT NULL,
    endTime TEXT,
    FOREIGN KEY (roomId) REFERENCES room(roomId)
);

CREATE TABLE room_adjacency (
    roomIdA INTEGER NOT NULL,
    roomIdB INTEGER NOT NULL,
    movableWall BOOLEAN NOT NULL DEFAULT FALSE,
    privateAccess BOOLEAN NOT NULL DEFAULT FALSE,
    PRIMARY KEY (roomIdA, roomIdB),
    FOREIGN KEY (roomIdA) REFERENCES room(roomId),
    FOREIGN KEY (roomIdB) REFERENCES room(roomId)
);

CREATE TABLE facility (
    facilityId INTEGER PRIMARY KEY,
    facilityType TEXT NOT NULL,
    location TEXT NOT NULL,
    buildingId INTEGER NOT NULL,
    facilityName TEXT NOT NULL,
    cardReaderId INTEGER,
    hotelId INTEGER NOT NULL
);

-- Sua: Customers and organization
CREATE TABLE organization (
    organizationId INTEGER PRIMARY KEY,
    organizationName TEXT NOT NULL,
    phoneNumber TEXT NOT NULL
);

CREATE TABLE customer (
    customerId INTEGER PRIMARY KEY,
    firstName TEXT NOT NULL,
    lastName TEXT NOT NULL,
    customerType TEXT NOT NULL,
    phoneNumber TEXT NOT NULL,
    whereaboutConfidential BOOLEAN NOT NULL DEFAULT TRUE, -- TRUE = confidential
    organizationId INTEGER,
    FOREIGN KEY (organizationId) REFERENCES organization(organizationId)
);

CREATE TABLE customer_qualification (
    qualificationId INTEGER PRIMARY KEY,
    customerId INTEGER NOT NULL,
    paidOnTime BOOLEAN NOT NULL,
    flexibility TEXT NOT NULL,
    cooperativeness TEXT NOT NULL,
    FOREIGN KEY (customerId) REFERENCES customer(customerId)
);

CREATE TABLE guest_messages (
    messageId INTEGER PRIMARY KEY,
    messageType TEXT NOT NULL,
    message TEXT NOT NULL,
    date TEXT NOT NULL,
    time TEXT NOT NULL,
    customerId INTEGER NOT NULL,
    FOREIGN KEY (customerId) REFERENCES customer(customerId)
);

CREATE TABLE customer_card (
    PIN INTEGER PRIMARY KEY,
    customerId INTEGER NOT NULL,
    FOREIGN KEY (customerId) REFERENCES customer(customerId)
);

CREATE TABLE customer_scan (
    scanId INTEGER PRIMARY KEY,
    PIN INTEGER NOT NULL,
    cardReaderId INTEGER NOT NULL,
    date TEXT NOT NULL,
    time TEXT NOT NULL,
    readDirection TEXT NOT NULL,
    FOREIGN KEY (PIN) REFERENCES customer_card(PIN),
    FOREIGN KEY (cardReaderId) REFERENCES card_reader(cardReaderId)
);

-- Carol: Services
CREATE TABLE services (
    serviceId INTEGER PRIMARY KEY,
    serviceStandardPrice INTEGER NOT NULL,
    serviceName TEXT NOT NULL,
    serviceCategory TEXT
);

-- Lauren: Event reservations and room allocations
CREATE TABLE event_reservation (
    eventReservationId INTEGER PRIMARY KEY,
    roomQuantity INTEGER NOT NULL,
    date TEXT NOT NULL,
    startTime TEXT NOT NULL,
    endTIme TEXT NOT NULL,
    minSeating INTEGER NOT NULL,
    customerId INTEGER NOT NULL,
    estimatedGuests INTEGER,
    hotelId INTEGER NOT NULL,
    facilityId INTEGER,
    FOREIGN KEY (customerId) REFERENCES customer(customerId),
    FOREIGN KEY (hotelId) REFERENCES hotel(hotelId),
    FOREIGN KEY (facilityId) REFERENCES facility(facilityId)
);

CREATE TABLE event(
    eventId INTEGER PRIMARY KEY,
    eventName TEXT NOT NULL,
    eventReservationId INTEGER NOT NULL,
    FOREIGN KEY (eventReservationId) REFERENCES event_reservation(eventReservationId)
);

CREATE TABLE event_room(
    eventRoomId INTEGER PRIMARY KEY,
    eventId INTEGER NOT NULL,
    roomId INTEGER NOT NULL,
    FOREIGN KEY (eventId) REFERENCES event(eventId),
    FOREIGN KEY (roomId) REFERENCES room(roomId)
);

-- Carol: Sleeping reservations, stay records, charges
CREATE TABLE total_bill (
    billId INTEGER PRIMARY KEY,
    amountPaid INTEGER NOT NULL,
    paymentDate TEXT,
    eventReservationId INTEGER,
    sleepingReservationId INTEGER,
    FOREIGN KEY (eventReservationId) REFERENCES event_reservation(eventReservationId),
    FOREIGN KEY (sleepingReservationId) REFERENCES sleeping_reservation(sleepingReservationId)
);

CREATE TABLE billed_party (
    billedPartyId INTEGER PRIMARY KEY,
    paymentInformation TEXT NOT NULL,
    billingAddress TEXT NOT NULL,
    splittingPercentage INTEGER,
    splitCharges TEXT,
    customerId INTEGER NOT NULL,
    organizationId INTEGER,
    billId INTEGER NOT NULL,
    FOREIGN KEY (customerId) REFERENCES customer(customerId),
    FOREIGN KEY (organizationId) REFERENCES organization(organizationId),
    FOREIGN KEY (billId) REFERENCES total_bill(billId)
);

CREATE TABLE service_charges (
    serviceTransactionId INTEGER PRIMARY KEY,
    chargeAmount INTEGER NOT NULL,
    discount INTEGER,
    transactionTransmittalForm INTEGER,
    serviceId INTEGER NOT NULL,
    billId INTEGER NOT NULL,
    FOREIGN KEY (serviceId) REFERENCES services(serviceId),
    FOREIGN KEY (billId) REFERENCES total_bill(billId)
);

CREATE TABLE sleeping_reservation (
    sleepingReservationId INTEGER PRIMARY KEY,
    expectedCheckIn TEXT NOT NULL,
    expectedCheckOut TEXT NOT NULL,
    numGuests INTEGER NOT NULL,
    bedType TEXT NOT NULL,
    smokingPreference BOOLEAN DEFAULT FALSE, --false is no smoking
    accessibility BOOLEAN DEFAULT FALSE, --false is not ADA accessible room
    bookingDate TEXT NOT NULL,
    reservationStatus TEXT NOT NULL,
    customerId INTEGER NOT NULL,
    hotelId INTEGER NOT NULL,
    eventReservationId INTEGER,
    FOREIGN KEY (customerId) REFERENCES customer(customerId),
    FOREIGN KEY (hotelId) REFERENCES hotel(hotelId),
    FOREIGN KEY (eventReservationId) REFERENCES event_reservation(eventReservationId)
);

CREATE TABLE hotel_stay_record (
    stayId INTEGER PRIMARY KEY,
    checkIn TEXT NOT NULL,
    checkOut TEXT NOT NULL,
    customerId INTEGER NOT NULL,
    roomId INTEGER NOT NULL,
    sleepingReservationId INTEGER NOT NULL,
    FOREIGN KEY (customerId) REFERENCES customer(customerId),
    FOREIGN KEY (roomId) REFERENCES room(roomId),
    FOREIGN KEY (sleepingReservationId) REFERENCES sleeping_reservation(sleepingReservationId)
);


