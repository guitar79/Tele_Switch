public void ch1_on() {
  if (connectedSerial) {
    serial.write('q'); println("type 'q'");
    status_text("Ch1 on");
  }
  isPressedCh1Button = !isPressedCh1Button;
  ((Toggle)cp5.getController("on1/off1")).setState(true);
  messageBoxResult = -1;
}

public void ch1_off() {
  createModalDialog("Are you sure to turn Anallemma Camera Power off?");
  if (messageBoxResult >= 1) return;
  if (connectedSerial) {
    serial.write('a'); println("type 'a'");
    status_text("Ch1 off");
  }
  isPressedCh1Button = !isPressedCh1Button;
  ((Toggle)cp5.getController("on1/off1")).setState(false);
  messageBoxResult = -1;
}

/* 
public void ch2_on() { 
  if (connectedSerial) {
    serial.write('w'); println("type 'w'");
    status_text("Ch2 on");
  }
  isPressedCh2Button = !isPressedCh2Button;
  ((Toggle)cp5.getController("on2/off2")).setState(true);
  messageBoxResult = -1;
}


public void ch2_off() {
  createModalDialog("ch2 off");
  if (messageBoxResult >= 1) return;
  if (connectedSerial) {
    serial.write('s');
    status_text("Ch2 off");
  }
  isPressedCh2Button = !isPressedCh2Button;
  ((Toggle)cp5.getController("on2/off2")).setState(false);
  messageBoxResult = -1;
}   
*/


public void One_shot() { //One shot
  if(connectedSerial){
    serial.write('x');
    println("type 'x'");
    status_text("One shot");
  }
  isPressedCh2Button = !isPressedCh2Button;
  ((Toggle)cp5.getController("on2/off2")).setState(false);
  messageBoxResult = -1;
}

public void Bulb_on() { //Bulb shot start
  if(connectedSerial){
    serial.write('w');
    println("type 'w'");
    status_text("Bulb shot on");
  }
  isPressedCh2Button = !isPressedCh2Button;
  ((Toggle)cp5.getController("on2/off2")).setState(true);
  messageBoxResult = -1;
}
public void Bulb_off() { //Bulb shot stop
  if(connectedSerial){
    serial.write('s');
    println("type 's'");
    status_text("Bulb shot off");
  }
  isPressedCh2Button = !isPressedCh2Button;
  ((Toggle)cp5.getController("on2/off2")).setState(false);
  messageBoxResult = -1;
}



public void ch3_on() {
  if (connectedSerial) {
    serial.write('e');
    status_text("Ch3 on");
  }
  isPressedCh3Button = !isPressedCh3Button;
  ((Toggle)cp5.getController("on3/off3")).setState(true);
  messageBoxResult = -1;
}

public void ch3_off() {
  createModalDialog("Ch3 off");
  if (messageBoxResult >= 1) return;
  if (connectedSerial) {
    serial.write('d'); println("type 'd'");
    status_text("Ch3 off");
  }
  isPressedCh3Button = !isPressedCh3Button;
  ((Toggle)cp5.getController("on3/off3")).setState(false);
  messageBoxResult = -1;
}

public void ch4_on() {
  if (connectedSerial) {
    serial.write('r'); println("type 'r'");
    status_text("Ch4 on");
  }
  isPressedCh4Button = !isPressedCh4Button;
  ((Toggle)cp5.getController("on4/off4")).setState(true);
  messageBoxResult = -1;
}

public void ch4_off() {
  createModalDialog("Are you sure to turn CCD Power off?");
   if (messageBoxResult >= 1)
    return;
  if (connectedSerial) {
    serial.write('f'); println("type 'f'");
    status_text("Ch4 off");
  }
  isPressedCh4Button = !isPressedCh4Button;
  ((Toggle)cp5.getController("on4/off4")).setState(false);
  messageBoxResult = -1;
}

public void ch5_on() {
  if (connectedSerial) {
    serial.write('t'); println("type 't'");
    status_text("Ch5 on");
  }
  isPressedCh5Button = !isPressedCh5Button;
  ((Toggle)cp5.getController("on5/off5")).setState(true);
  messageBoxResult = -1;
}

public void ch5_off() {
  createModalDialog("Are you sure to turn Motor focuser Power off?");
  if (messageBoxResult >= 1) return;
  if (connectedSerial) {
    serial.write('g'); println("type 'g'");
    status_text("Ch5 off");
  }
  isPressedCh5Button = !isPressedCh5Button;
  ((Toggle)cp5.getController("on5/off5")).setState(false);
  messageBoxResult = -1;
}
public void ch6_on() {
  createModalDialog("Are you sure to open roof?");
  if (messageBoxResult >= 1) return;
  if (connectedSerial) {
    serial.write('y'); println("type 'y'");
    status_text("Roof open");
  }
  isPressedroofButton = !isPressedroofButton;
  ((Toggle)cp5.getController("opend/closed")).setState(true);
  messageBoxResult = -1;
}
public void ch6_on_on() {
  if (connectedSerial) {
    serial.write('y'); println("type 'y'"); delay(100);serial.write('y'); println("type 'y'");
    status_text("Roop Open");
  }
  isPressedroofButton = !isPressedroofButton;
  ((Toggle)cp5.getController("opend/closed")).setState(true);
  messageBoxResult = -1;
}

public void res6_on() {
  if (connectedSerial) {
    println("type 'Res6 on'");
    status_text("Res6 on");
  }
  isPressedCh6Button = !isPressedCh6Button;
  ((Toggle)cp5.getController("on6/off6")).setState(true);
  messageBoxResult = -1;
}

public void res6_off() {
  createModalDialog("Are you sure?");
  if (messageBoxResult >= 1) return;
  if (connectedSerial) {
    println("type 'Res6 off'");
    status_text("Res6 off");
  }
  isPressedCh6Button = !isPressedCh6Button;
  ((Toggle)cp5.getController("on6/off6")).setState(false);
  messageBoxResult = -1;
}

public void ch7_on() {
  createModalDialog("Are you sure to close roof?");
  if (connectedSerial) {
    serial.write('u'); println("type 'u'");
    status_text("Roof close");
  }
  isPressedroofButton = !isPressedroofButton;
  ((Toggle)cp5.getController("opend/closed")).setState(false);
  messageBoxResult = -1;
}
public void ch7_on_on() {
  if (connectedSerial) {
    serial.write('u'); println("type 'u'"); delay(100);serial.write('u'); println("type 'u'");
    status_text("Roop Close");
  }
  isPressedroofButton = !isPressedroofButton;
  ((Toggle)cp5.getController("opend/closed")).setState(false);
  messageBoxResult = -1;
}

public void res7_on() {
  if (connectedSerial) {
    println("type 'Res7 on'");
    status_text("Res7 on");
  }
  isPressedCh7Button = !isPressedCh7Button;
  ((Toggle)cp5.getController("on7/off7")).setState(true);
  messageBoxResult = -1;
}

public void res7_off() {
  createModalDialog("Are you sure?");
  if (messageBoxResult >= 1) return;
  if (connectedSerial) {
    println("type 'Res7 off'");
    status_text("Res7 off");
  }
  isPressedCh7Button = !isPressedCh7Button;
  ((Toggle)cp5.getController("on7/off7")).setState(false);
  messageBoxResult = -1;
}


public void res2_on() {
  if (connectedSerial) {
    println("type 'Res2 on'");
    status_text("Res2 on");
  }
  isPressedCh22Button = !isPressedCh22Button;
  ((Toggle)cp5.getController("on22/off22")).setState(true);
  messageBoxResult = -1;
}

public void res2_off() {
  createModalDialog("Are you sure?");
  if (messageBoxResult >= 1) return;
  if (connectedSerial) {
    println("type 'Res2 off'");
    status_text("Res2 off");
  }
  isPressedCh22Button = !isPressedCh22Button;
  ((Toggle)cp5.getController("on22/off22")).setState(false);
  messageBoxResult = -1;
}

public void ch8_on() {
  if (connectedSerial) {
    serial.write('i'); println("type 'i'");
    status_text("Roof stop");
  }
}


void status_text(String status_message){
  fill(255);
  rect(status_text_x-50,15,150,25);
  textSize(11);
  fill(0);
  text(status_message, status_text_x, status_text_y);
}