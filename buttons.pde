void set_buttons(){
 
  cp5.addButton("ch1_on")
    .setPosition(ch_button_x0+ch_button_w*0,ch_button_y0)
    .setSize(80,20)
    ;
  cp5.addButton("ch1_off")
    .setPosition(ch_button_x0+ch_button_w*1,ch_button_y0)
    .setSize(80,20)
    ;
  cp5.addToggle("on1/off1")
    .setPosition(ch_button_x0+ch_button_w*2,ch_button_y0)
    .setSize(50,20)
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    .lock()
    ;
  cp5.addButton("Ch2_on")
    .setPosition(ch_button_x0+ch_button_w*0,ch_button_y0+ch_button_h*1)
    .setSize(80,20)
    ;
  cp5.addButton("Ch2_off")
    .setPosition(ch_button_x0+ch_button_w*1,ch_button_y0+ch_button_h*1)
    .setSize(80,20)
    ;
  cp5.addToggle("on2/off2")
    .setPosition(ch_button_x0+ch_button_w*2,ch_button_y0+ch_button_h*1)
    .setSize(50,20)
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    .lock()
    ;
  
  cp5.addButton("ch3_on")
    .setPosition(ch_button_x0,ch_button_y0+ch_button_h*2)
    .setSize(80,20)
    ;
  cp5.addButton("ch3_off")
    .setPosition(ch_button_x0+ch_button_w*1,ch_button_y0+ch_button_h*2)
    .setSize(80,20)
    ;
  cp5.addToggle("on3/off3")
    .setPosition(ch_button_x0+ch_button_w*2,ch_button_y0+ch_button_h*2)
    .setSize(50,20)
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    .lock()
    ;
  
  cp5.addButton("ch4_on")
    .setPosition(ch_button_x0+ch_button_w*0,ch_button_y0+ch_button_h*3)
    .setSize(80,20)
    ;
  cp5.addButton("ch4_off")
    .setPosition(ch_button_x0+ch_button_w*1,ch_button_y0+ch_button_h*3)
    .setSize(80,20)
    ;
  cp5.addToggle("on4/off4")
    .setPosition(ch_button_x0+ch_button_w*2,ch_button_y0+ch_button_h*3)
    .setSize(50,20)
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    .lock()
    ;    

}
void set_button_texts(){
  textSize(14);
  text("Anallemma Camera Power", 20, ch_button_y0+ch_button_h*0-10);
  text("Anallemma Camera Shutter", 20, ch_button_y0+ch_button_h*1-10);
  text("Astronomical CCD Power control", 20, ch_button_y0+ch_button_h*3-10);
  text("Motor focuser Power control", 20, ch_button_y0+ch_button_h*4-10);
  text("Roof control", 272+ch_button_w*0, ch_button_y0+ch_button_h*0-10);
  text("Open", 275+ch_button_w*0, ch_button_y0+ch_button_h*0+15);
  text("Close", 275+ch_button_w*0, ch_button_y0+ch_button_h*1+10);
  text("Stop", 275+ch_button_w*0, ch_button_y0+ch_button_h*2+5);
  text("Auto Shutter", 272+ch_button_w*0, ch_button_y0+ch_button_h*3-10);
  text("every 15 sec", 300+ch_button_w*0, ch_button_y0+ch_button_h*3+25);
  text("Anallemma Automation", 272+ch_button_w*0, ch_button_y0+ch_button_h*4-10);
}