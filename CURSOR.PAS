PROGRAM CURSOR;
USES
    DOS,CRT,TP;
VAR
   REGS:REGISTERS;
PROCEDURE AJUDA;
BEGIN
     GOTOXY(1,WHEREY+1);
     TEXTCOLOR(7);
     WRITELN('  CURSOR ‚ um programa que muda a aparˆncia do cursor do ecran, de acordo');
     WRITELN('com o parametro inserido na linha de comandos.');
     WRITELN;
     WRITELN('  Sintaxe : ');
     WRITELN('            CURSOR /?');
     WRITELN('            CURSOR <aparˆncia>');
     WRITELN;
     WRITELN('  Aparˆncia  : ');
     WRITELN('               NORM   ÍÍ  Cursor com aparˆncia normal  (assumido por defeito)');
     WRITELN('               OFF    ÍÍ  Cursor inactivo');
     WRITELN('               TOP1   ÍÍ  Cursor estreito no topo');
     WRITELN('               TOP2   ÍÍ  Cursor m‚dio estreito no topo');
     WRITELN('               TOP3   ÍÍ  Cursor m‚dio largo no topo');
     WRITELN('               TOP4   ÍÍ  Cursor largo no topo');
     WRITELN('               DOWN1  ÍÍ  Cursor estreito no fundo');
     WRITELN('               DOWN2  ÍÍ  Cursor m‚dio no fundo');
     WRITELN('               DOWN3  ÍÍ  Cursor largo no fundo');
     WRITELN('               BIG    ÍÍ  Cursor completo (Û)');
     WRITELN;
     WRITELN;
     HALT;
END;
PROCEDURE NORM;
BEGIN
     REGS.AH:=$01;
     REGS.CH:=$06;
     REGS.CL:=$07;
     INTR($10,REGS);
     HALT;
END;
PROCEDURE OFF;
BEGIN
     REGS.AH:=$01;
     REGS.CH:=$70;
     REGS.CL:=$00;
     INTR($10,REGS);
     HALT;
END;
PROCEDURE TOP1;
BEGIN
     REGS.AH:=$01;
     REGS.CH:=$00;
     REGS.CL:=$00;
     INTR($10,REGS);
     HALT;
END;
PROCEDURE TOP2;
BEGIN
     REGS.AH:=$01;
     REGS.CH:=$00;
     REGS.CL:=$01;
     INTR($10,REGS);
     HALT;
END;
PROCEDURE TOP3;
BEGIN
     REGS.AH:=$01;
     REGS.CH:=$00;
     REGS.CL:=$02;
     INTR($10,REGS);
     HALT;
END;
PROCEDURE TOP4;
BEGIN
     REGS.AH:=$01;
     REGS.CH:=$00;
     REGS.CL:=$03;
     INTR($10,REGS);
     HALT;
END;
PROCEDURE DOWN1;
BEGIN
     REGS.AH:=$01;
     REGS.CH:=$07;
     REGS.CL:=$07;
     INTR($10,REGS);
     HALT;
END;
PROCEDURE DOWN2;
BEGIN
     REGS.AH:=$01;
     REGS.CH:=$03;
     REGS.CL:=$05;
     INTR($10,REGS);
     HALT;
END;
PROCEDURE DOWN3;
BEGIN
     REGS.AH:=$01;
     REGS.CH:=$03;
     REGS.CL:=$06;
     INTR($10,REGS);
     HALT;
END;
PROCEDURE BIG;
BEGIN
     REGS.AH:=$01;
     REGS.CH:=$00;
     REGS.CL:=$04;
     INTR($10,REGS);
     HALT;
END;
BEGIN
     S:='';
     LOGOTIPO('CURSOR V1.0',1994);
     TEXTCOLOR(9);
     WRITEXY('NUNO MIGUEL B. PICADO',5,3);
     TEXTCOLOR(7);
     WRITELN;
     WRITELN;
     IF PARAMCOUNT>1 THEN AJUDA;
     IF PARAMCOUNT=0 THEN S:='NORM'
                     ELSE S:=PARAMSTR(1);
     FOR I:=1 TO LENGTH(S) DO
         S[I]:=UPCASE(S[I]);
     IF S='NORM' THEN NORM;
     IF S='OFF' THEN OFF;
     IF S='TOP1' THEN TOP1;
     IF S='TOP2' THEN TOP2;
     IF S='TOP3' THEN TOP3;
     IF S='TOP4' THEN TOP4;
     IF S='DOWN1' THEN DOWN1;
     IF S='DOWN2' THEN DOWN2;
     IF S='DOWN3' THEN DOWN3;
     IF S='BIG' THEN BIG;
     AJUDA;
END.