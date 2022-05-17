PRAGMA foreign_keys = OFF;

DROP TABLE STO_DETAIL;
DROP TABLE STO_CELL;
DROP TABLE STO;
DROP TABLE DETAIL;
DROP TABLE CELL;
DROP TABLE WORKER;

PRAGMA foreign_keys = ON;

CREATE TABLE STO
(
    id   INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE DETAIL
(
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    name            TEXT NOT NULL,
    operationNumber TEXT NOT NULL,
    UNIQUE (name, operationNumber)
);

CREATE TABLE STO_DETAIL
(
    sto_id    INTEGER REFERENCES STO (id),
    detail_id INTEGER REFERENCES DETAIL (id),
    PRIMARY KEY (sto_id, detail_id)
);

CREATE TABLE CELL
(
    id         INTEGER PRIMARY KEY AUTOINCREMENT,
    stasNumber INTEGER,
    side       TEXT,
    cellNumber INTEGER NOT NULL,
    removed    TEXT,
    note       TEXT
);

CREATE TABLE STO_CELL
(
    sto_id    INTEGER REFERENCES STO (id),
    cell_id   INTEGER REFERENCES CELL (id),
    remainder INTEGER NOT NULL,
    PRIMARY KEY (sto_id, cell_id)
);

CREATE TABLE WORKER
(
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    name            TEXT        NOT NULL,
    personnelNumber TEXT UNIQUE NOT NULL
);


INSERT INTO STO (NAME)
VALUES ('sto1');
INSERT INTO STO (NAME)
VALUES ('sto2');

INSERT INTO DETAIL (NAME, operationNumber)
VALUES ('detail1', 'operation1');
INSERT INTO DETAIL (NAME, operationNumber)
VALUES ('detail2', 'operation2');

INSERT INTO STO_DETAIL (STO_ID, DETAIL_ID)
VALUES (1, 1); -- sto1 detail1
INSERT INTO STO_DETAIL (STO_ID, DETAIL_ID)
VALUES (1, 2); -- sto1 detail2
INSERT INTO STO_DETAIL (STO_ID, DETAIL_ID)
VALUES (2, 1); -- sto2 detail1

INSERT INTO CELL (cellNumber)
VALUES (10);
INSERT INTO CELL (cellNumber)
VALUES (11);

INSERT INTO STO_CELL (sto_id, cell_id, remainder)
VALUES (1, 1, 5); -- sto1 cell10 remainder5
INSERT INTO STO_CELL (sto_id, cell_id, remainder)
VALUES (1, 2, 2); -- sto1 cell11 remainder2
INSERT INTO STO_CELL (sto_id, cell_id, remainder)
VALUES (2, 1, 3); -- sto2 cell10 remainder3

INSERT INTO WORKER (name, personnelNumber)
VALUES ('worker1', 'workerNumber1');
INSERT INTO WORKER (name, personnelNumber)
VALUES ('worker2', 'workerNumber2');




