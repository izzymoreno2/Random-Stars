unit MainProg;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Math, StdCtrls, Star1;

Const
//�������� ���������
MaxStars = 400;
xmax = 642;
ymax = 485;
xmin = 0;
ymin = 0;
XScreenMax = 642;
YScreenMax = 485;


type
  TForm1 = class(TForm)
    Image1: TImage;
    TimerFPS: TTimer;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TimerFPSTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  //������ ����
  Stars: array[0..MaxStars - 1] of TMyStar;

//������� ����������� Canvas
VirtBitmap: TBitmap;

//����
implementation

{$R *.DFM}

procedure TForm1.FormCreate(Sender: TObject);
var
i:integer;
SX,SY:integer;
begin
//��������� Canvas ������ ������
self.TimerFPS.Enabled:=false;
self.TimerFPS.Interval:=20;
Form1.Image1.Canvas.Brush.Color:=clBlack;
Form1.Image1.Canvas.FillRect(Rect(xmin,ymin,XScreenMax,YScreenMax));
Form1.Image1.Width:=XScreenMax;
Form1.Image1.Height:=YScreenMax;
//������ ����������� Bitmap
VirtBitmap:=TBitmap.Create;
VirtBitmap.Width:=Image1.Width;
VirtBitmap.Height:=Image1.Height;
VirtBitmap.Canvas.Brush.Color:=clBlack;
VirtBitmap.Canvas.FillRect(Rect(xmin,ymin,XScreenMax,YScreenMax));
//������ �����
for i := 0 to MaxStars-1 do
   begin
   //������ ����� � ������������� ������������ ���������� �� X � ��������� �� Y
   SX:=round(Random*xmax);
   SY:=round(Random*ymax);
   Stars[i]:= TMyStar.CreateStar(SX,SY, 'left', Form1);
   //SX:=xmax; //Worms[i].ImgMass[1].Width;
   //SY:=Random(ymax)-Stars[i].ImgMassStar[1].Width;
   end;
//�������� ������ ���������
self.TimerFPS.Enabled:=true;
end;

procedure TForm1.FormDestroy(Sender: TObject);
var
i:integer;
begin
//��������� ������ ���������
self.TimerFPS.Enabled:=false;
//������� �� ������ ������ ����
for i := 0 to MaxStars-1 do
   begin
   Stars[i].free;
   end;
VirtBitmap.Free;
end;

procedure TForm1.TimerFPSTimer(Sender: TObject);
var
i:integer;
begin
VirtBitmap.Canvas.FillRect(Rect(0,0,VirtBitmap.Width,VirtBitmap.Height));
//������ ������ ������������ �� ����������� ������
//�����
for i := 0 to MaxStars - 1 do
   begin
   If Stars[i] <> nil then
      begin
      Stars[i].Show();
      end;
   end;
   //�������� ����������� ������
Form1.Image1.Canvas.Draw(10,10,VirtBitmap);
end;

end.
