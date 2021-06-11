       IDENTIFICATION DIVISION.
       PROGRAM-ID. item-processing.
       DATA DIVISION.
           LINKAGE SECTION.

           01 ITEM.
             05 SELL-IN PIC S999 SIGN IS LEADING SEPARATE CHARACTER.
             05 FILLER PIC X VALUE SPACE.
             05 QUALITY PIC S999 SIGN IS LEADING SEPARATE CHARACTER.
             05 FILLER PIC X VALUE SPACE.
             05 ITEM-NAME PIC X(50).

           PROCEDURE DIVISION USING ITEM.
           

          *>  IF ITEM-NAME = '+5 Dexterity Vest' OR 
          *>    'Elixir of the Mongoose' GO TO 0100-normal-item.
           
           IF ITEM-NAME(1:4) = 'Aged' GO TO 0110-aged-brie.

           IF ITEM-NAME = 
             'Sulfuras, Hand of Ragnaros' GO TO 0130-sulfuras.

           IF ITEM-NAME(1:8) = 'Conjured' GO TO 0200-conjured-item.

           IF ITEM-NAME(1:9) = 'Backstage' GO TO 0140-backstage-pass.

          *>  GOBACK.

          *>  ----------------------ITEM LOGIC-------------------------
       0100-normal-item SECTION.
           IF QUALITY > 0
             SUBTRACT 1 FROM QUALITY
           END-IF.

           SUBTRACT 1 FROM SELL-IN.

           IF SELL-IN < 0 AND QUALITY > 0
             SUBTRACT 2 FROM QUALITY
           END-IF.

           GOBACK.
           
       0110-aged-brie SECTION.
           IF QUALITY < 50
             ADD 1 TO QUALITY
           END-IF.

           SUBTRACT 1 FROM SELL-IN.

           IF SELL-IN < 0 AND QUALITY < 50
             ADD 1 TO QUALITY 
           END-IF.

           GOBACK.  

       0130-sulfuras SECTION.
           GOBACK.

       0140-backstage-pass SECTION.
           IF QUALITY < 50
             ADD 1 TO QUALITY
           END-IF.

           IF SELL-IN < 11 AND QUALITY < 50
             ADD 1 TO QUALITY
           END-IF.

           IF SELL-IN < 6 AND QUALITY < 50
             ADD 1 TO QUALITY
           END-IF.

           SUBTRACT 1 FROM SELL-IN.

           IF SELL-IN < 0
             SUBTRACT QUALITY FROM QUALITY
           END-IF.

           GOBACK.
             
       0200-conjured-item SECTION.
           IF QUALITY > 0
             SUBTRACT 2 FROM QUALITY
           END-IF.

           SUBTRACT 1 FROM SELL-IN.

           IF SELL-IN < 0 AND QUALITY > 0
             SUBTRACT 4 FROM QUALITY
           END-IF.

           GOBACK.

      *>   ------------------------ITEM LOGIC END-----------------------

      *>  0120-elixir-of-mongoose SECTION.
      *>      IF QUALITY > 0
      *>        SUBTRACT 1 FROM QUALITY
      *>      END-IF.

      *>      SUBTRACT 1 FROM SELL-IN.

      *>      IF SELL-IN < 0 AND QUALITY > 0
      *>        SUBTRACT 1 FROM QUALITY
      *>      END-IF.

      *>      GOBACK. 

      *>  0100-dex-vest SECTION.
      *>      IF QUALITY > 0
      *>        SUBTRACT 1 FROM QUALITY
      *>      END-IF.

      *>      SUBTRACT 1 FROM SELL-IN.

      *>      IF SELL-IN < 0 AND QUALITY > 0
      *>        SUBTRACT 1 FROM QUALITY
      *>      END-IF.

      *>      GOBACK.
