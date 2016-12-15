import processing.serial.*;  
import controlP5.*;
import javax.swing.*;

ControlP5 cp5;

Textfield P;
Textfield I;
Textfield D;
Textfield targetAngle;

String stringP = "";
String stringI = "";
String stringD = "";
String stringTargetAngle = "";

PFont f;

boolean useDropDownLists = true; // Set if you want to use the dropdownlist or not
byte defaultComPort = 0;
int defaultBaudrate = 115200;

//Dialog
int messageBoxResult = -1;


//Dropdown lists
DropdownList COMports; // Define the variable ports as a Dropdownlist.
Serial serial; // Define the variable port as a Serial object.
int portNumber = -1; // The dropdown list will return a float value, which we will connvert into an int. We will use this int for that.

DropdownList baudrate;
int selectedBaudrate = -1; // Used to indicate which baudrate has been selected
String[] baudrates = {
  "1200", "2400", "4800", "9600", "19200", "38400", "57600", "115200" // these are the supported baudrates by a module
};
boolean connectedSerial;
boolean aborted;
boolean isPressedCameraButton = false;
boolean isPressedTemp1Button = false;
boolean isPressedTemp2Button = false;
boolean isPressedMotorButton = false;


void setup()
{
  
  try { 
    UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
  } 
  catch (Exception e) { 
    e.printStackTrace();
  } 
  
  cp5 = new ControlP5(this);
  size(600, 600);

  f = loadFont("Arial-BoldMT-30.vlw");
  textFont(f, 30);
  
 

  //println(serial.list()); // Used for debugging
  if (useDropDownLists)
  {
    /* Drop down lists */
    COMports = cp5.addDropdownList("COMPort", 60, 100, 150, 200); // Make a dropdown list with all comports
    customize(COMports); // Setup the dropdownlist by using a function

    baudrate = cp5.addDropdownList("Baudrate", 215, 100, 55, 200); // Make a dropdown with all the available baudrates   
    customize(baudrate); // Setup the dropdownlist by using a function

    cp5.addButton("Connect", 0, 275, 100, 45, 15);
    cp5.addButton("Disconnect", 0, 325, 100, 52, 15);
  }
  else // if useDropDownLists is false, it will connect automatically at startup
  {
    serial = new Serial(this, Serial.list()[defaultComPort], defaultBaudrate);
    serial.bufferUntil('\n');
    connectedSerial = true;
    serial.write("G;"); // Go
  }
  
    // create a new button with name 'buttonA'
  cp5.addButton("camera_on")
     .setPosition(60,350)
     .setSize(100,19)
     ;
  cp5.addButton("camera_off")
     .setPosition(170,350)
     .setSize(100,19)
     ;
      
  // create a toggle
  cp5.addToggle("on1/off1")
     .setPosition(280,350)
     .setSize(100,19)
     ;
     
  // 
  cp5.addButton("temp1_on")
     .setPosition(60,400)
     .setSize(100,19)
     ;
  cp5.addButton("temp1_off")
     .setPosition(170,400)
     .setSize(100,19)
     ;
  cp5.addToggle("on2/off2")
     .setPosition(280,400)
     .setSize(100,19)
     ;
     //
  cp5.addButton("temp2_on")
     .setPosition(60,450)
     .setSize(100,19)
     ;
  cp5.addButton("temp2_off")
     .setPosition(170,450)
     .setSize(100,19)
     ;
  cp5.addToggle("on3/off3")
     .setPosition(280,450)
     .setSize(100,19)
     ;
     //
  cp5.addButton("motor_on")
     .setPosition(60,500)
     .setSize(100,19)
     ;
  cp5.addButton("motor_off")
     .setPosition(170,500)
     .setSize(100,19)
     ;
  cp5.addToggle("on4/off4")
     .setPosition(280,500)
     .setSize(100,19)
     ;
  background(0);  
}

void draw() 
{
/*

  background(0);

  fill(0, 102, 153);
  textSize(30); 
  textAlign(CENTER); 

  fill(255, 255, 255);
  textSize(10);  
  textAlign(LEFT);
*/

}
void Abort(int theValue)
{
  if (connectedSerial) 
  {
    serial.write("A;");
    aborted = true;
}
  else
    println("Establish a serial connection first!");
}
void Continue(int theValue)
{
  if (connectedSerial) 
  {
    serial.write("C;");
    aborted = false;
        background(100);
  }
  else
    println("Establish a serial connection first!");
}
void Submit(int theValue) 
{
  if (connectedSerial)
  {    
      delay(10);    
  }
  else
    println("Establish a serial connection first!");
}


void serialEvent(Serial serial)
{
  
}
void keyPressed() 
{
  
}
void customize(DropdownList ddl) 
{
  ddl.setBackgroundColor(color(200));//Set the background color of the line between values
  ddl.setItemHeight(20);//Set the height of each item when the list is opened.
  ddl.setBarHeight(15);//Set the height of the bar itself.

  ddl.getCaptionLabel().getStyle().marginTop = 3;//Set the top margin of the lable.  
  ddl.getCaptionLabel().getStyle().marginLeft = 3;//Set the left margin of the lable.  
  ddl.getCaptionLabel().getStyle().marginTop = 3;//Set the top margin of the value selected.

  if (ddl.getName() == "Baudrate")
  {
    ddl.getCaptionLabel().set("Baudrate");
    for (int i=0; i<baudrates.length; i++)
      ddl.addItem(baudrates[i], i); // give each item a value
  }
  else if (ddl.getName() == "COMPort")
  {
    ddl.getCaptionLabel().set("Select COM port");//Set the lable of the bar when nothing is selected. 
    //Now well add the ports to the list, we use a for loop for that.
    for (int i=0; i<serial.list().length; i++)    
      ddl.addItem(serial.list()[i], i);//This is the line doing the actual adding of items, we use the current loop we are in to determin what place in the char array to access and what item number to add it as.
  }
  ddl.setColorBackground(color(60));
  ddl.setColorActive(color(255, 128));
}
void controlEvent(ControlEvent theEvent) {
 if (theEvent.isGroup()) {
    println("event from group : "+theEvent.getGroup().getValue()+" from "+theEvent.getGroup());
  } 
  else if (theEvent.isController()) {
    if (theEvent.getName() == "COMPort")
          portNumber = int(theEvent.getController().getValue());
    else if(theEvent.getName() == "Baudrate")
          selectedBaudrate = int(theEvent.getController().getValue());
  }
}

void Connect(int theValue)
{ 
  println("port Num = " + Serial.list()[portNumber]);
  if (selectedBaudrate != -1 && portNumber != -1 && !connectedSerial)//Check if com port and baudrate is set and if there is not already a connection established
  {
    println("ConnectSerial");
    background(100);
    fill(255,255,255);
    text("Serial connected", 80, 60);
    
    serial = new Serial(this, Serial.list()[portNumber], Integer.parseInt(baudrates[selectedBaudrate]));
    connectedSerial = true;
    serial.bufferUntil('\n');
    serial.write("G;"); // Go
  }
  else if (portNumber == -1)
    println("Select COM Port first!");
  else if (selectedBaudrate == -1)
    println("Select baudrate first!");
  else if (connectedSerial)
    println("Already connected to a port!");
}

void Disconnect(int theValue)
{
  if (connectedSerial)//Check if there is a connection established
  {
     serial.stop();
     serial = null;
     connectedSerial = false;
     background(0); // background color change by Kevin
    fill(255,255,255);
    text("Serial disconnected", 80, 60);
     println("Serial disconnected");
  }
  else
    println("Couldn't disconnect");
}


public void camera_on() {
  //println("a button event from colorA: "+theValue);
  //c1 = c2;
  //c2 = color(0,160,100);
  if (isPressedCameraButton && connectedSerial) {
    serial.write('r');
  } else if (!isPressedCameraButton && connectedSerial) {
    serial.write('r');
  }
  isPressedCameraButton = !isPressedCameraButton;
  ((Toggle)cp5.getController("on1/off1")).setState(true);
     messageBoxResult = -1;
}

public void camera_off() {
  
  createModalDialog("camera off");
  if (messageBoxResult >= 1)
    return;
  
  if (isPressedCameraButton && connectedSerial) {
    serial.write('f');
  } else if (!isPressedCameraButton && connectedSerial) {
    serial.write('f');
  }
  isPressedCameraButton = !isPressedCameraButton;
    ((Toggle)cp5.getController("on1/off1")).setState(false);
   
   messageBoxResult = -1;

}

public void temp1_on() {
  if (isPressedTemp1Button && connectedSerial) {
    serial.write('e');
  } else if (!isPressedTemp1Button && connectedSerial) {
    serial.write('e');
  }
  isPressedTemp1Button = !isPressedTemp1Button;
    ((Toggle)cp5.getController("on2/off2")).setState(true);
       messageBoxResult = -1;
}

public void temp1_off() {
  createModalDialog("Temp1 off");
  if (messageBoxResult >= 1)
    return;
  if (isPressedTemp1Button && connectedSerial) {
    serial.write('d');
  } else if (!isPressedTemp1Button && connectedSerial) {
    serial.write('d');
  }
  isPressedTemp1Button = !isPressedTemp1Button;
  ((Toggle)cp5.getController("on2/off2")).setState(false);

  messageBoxResult = -1;

}

public void temp2_on() {
  if (isPressedTemp2Button && connectedSerial) {
    serial.write('w');
  } else if (!isPressedTemp2Button && connectedSerial) {
    serial.write('w');
  }
  isPressedTemp2Button = !isPressedTemp2Button;
    ((Toggle)cp5.getController("on3/off3")).setState(true);
       messageBoxResult = -1;
}


public void temp2_off() {
  createModalDialog("Temp2 off");
   if (messageBoxResult >= 1)
    return;
  
  if (isPressedTemp2Button && connectedSerial) {
    serial.write('s');
  } else if (!isPressedTemp2Button && connectedSerial) {
    serial.write('s');
  }
  isPressedTemp2Button = !isPressedTemp2Button;
    ((Toggle)cp5.getController("on3/off3")).setState(false);
       messageBoxResult = -1;
}

public void motor_on() {
  if (isPressedMotorButton && connectedSerial) {
    serial.write('q');
  } else if (!isPressedMotorButton && connectedSerial) {
    serial.write('q');
  }
  isPressedMotorButton = !isPressedMotorButton;
    ((Toggle)cp5.getController("on4/off4")).setState(true);
       messageBoxResult = -1;
}


public void motor_off() {
   
  createModalDialog("Motor off");
   if (messageBoxResult >= 1)
    return;
  
  if (isPressedMotorButton && connectedSerial) {
    serial.write('a');
  } else if (!isPressedMotorButton && connectedSerial) {
    serial.write('a');
  }
  isPressedMotorButton = !isPressedMotorButton;
    ((Toggle)cp5.getController("on4/off4")).setState(false);
       messageBoxResult = -1;
}

void createModalDialog(String message) {

    messageBoxResult = JOptionPane.showConfirmDialog(frame, message);
   
}