       IDENTIFICATION DIVISION.
       PROGRAM-ID. "gilded-rose".

       ENVIRONMENT DIVISION.
           INPUT-OUTPUT SECTION.
           FILE-CONTROL.
             SELECT FI-IN-ITEMS ASSIGN "in.dat"
               ORGANISATION IS LINE SEQUENTIAL.
             SELECT FI-OUT-ITEMS ASSIGN "out.dat"
               ORGANISATION IS LINE SEQUENTIAL.

       DATA DIVISION.
           FILE SECTION.
           FD FI-IN-ITEMS.
           01 FS-IN-ITEM PIC X(60).
           FD FI-OUT-ITEMS.
           01 FS-OUT-ITEM.
             05 SELL-IN PIC S999 SIGN IS LEADING SEPARATE CHARACTER.
             05 FILLER PIC X VALUE SPACE.
             05 QUALITY PIC S999 SIGN IS LEADING SEPARATE CHARACTER.
             05 FILLER PIC X VALUE SPACE.
             05 ITEM-NAME PIC X(50).

       PROCEDURE DIVISION.
           OPEN INPUT FI-IN-ITEMS OUTPUT FI-OUT-ITEMS.

       0100-start SECTION.
           READ FI-IN-ITEMS AT END GO TO 0200-end.
             MOVE FS-IN-ITEM TO FS-OUT-ITEM.

           CALL 'item-processing' USING FS-OUT-ITEM.

           WRITE FS-OUT-ITEM.
           GO TO 0100-start.

       0200-end SECTION.
           CLOSE FI-IN-ITEMS.
           CLOSE FI-OUT-ITEMS.

       0300-return SECTION.
           GOBACK.



