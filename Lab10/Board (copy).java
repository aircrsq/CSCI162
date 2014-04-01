import java.applet.Applet;
import java.applet.AudioClip;
import java.awt.*;
import java.awt.event.*;

import java.applet.*;
import java.awt.*;
import java.awt.event.*;
import java.io.*;
import javax.swing.JFrame;
import java.net.URL;

import javax.swing.*;
import java.awt.event.*;




public class Board extends Applet implements Runnable , KeyListener  {
	
	private Image BackgroundImage;
	private Image foggy;
	private Image rain;
	private Image snow;
	private Image sun;
	AudioClip soundtrack;
	
	int level;
	
	boolean running;
	boolean gameIsOver;
	boolean gameIsDone;
	int xbound,xbound1;
	int ybound;
	int xcloud;
	mainChar maincar;

	private Thread ballThread;

	
	public Board() {
		initGame();
		addKeyListener(this);
		loadImages();
				
		ballThread = new Thread(this);
		
		maincar = new mainChar();
		
		soundtrack.play();
	}
	
	public void loadImages(){
		BackgroundImage = Toolkit.getDefaultToolkit().getImage(getClass().getResource("edFULLBACKGROUND.png")); 
		foggy = Toolkit.getDefaultToolkit().getImage(getClass().getResource("CLOUD.png")); 
		
		sun = Toolkit.getDefaultToolkit().getImage(getClass().getResource("sun.png")); 
		
		// Audio Clip
		soundtrack = Applet.newAudioClip(getClass().getResource("music.wav"));
	}
	
	
	
	public void initGame() {
		running 	= true;
		gameIsOver 	= false;
		xbound 		= 0;
		xbound1 	= 1200;
		ybound 		= 80;
		level 		= 1;
		xcloud		= 0;
	
	}
	

	
	public void keyTyped(KeyEvent e ){
	   char c = e.getKeyChar();
	   if ( c != KeyEvent.CHAR_UNDEFINED ) {
			 
	      if (c == ' ')
	         {
	       	    running = ! running;
	         }         
	   }
	}
	
	public void keyReleased(KeyEvent e){}
	public void keyPressed(KeyEvent e ) {
		int keyCode = e.getKeyCode();
		switch( keyCode ) {
		case KeyEvent.VK_UP:
			maincar.moveUp();
		break;
		case KeyEvent.VK_DOWN:
			maincar.moveDown();
		break;
		case KeyEvent.VK_RIGHT:
			xbound--; 
			xbound1--;
			
			maincar.moveRight();
			break;
		
		case KeyEvent.VK_LEFT:		
			maincar.moveLeft();
			break;
		}
	}
	
	public void start () {
		ballThread.start();
	}
	
	
	public void run() {
		Thread.currentThread().setPriority(Thread.MIN_PRIORITY);	
		while (true){
			if(running){ 
			}
			
			try {
				Thread.sleep(90);
			}catch(InterruptedException ex) { }
			
                        if(running){
			   repaint();
                        }
			Thread.currentThread().setPriority(Thread.MAX_PRIORITY);
		}
	}
	
	

	public void labIsDone(Graphics g){
  	   Font z = new Font("Courier",Font.BOLD,30);
           g.setFont(z);
           g.setColor(Color.white);
           g.drawString("Beatilful Day ! ", 500, 132);
	   g.drawString("You Have Done your Lab :) ", 450, 172);
           g.setColor(Color.black);
        
           g.drawString("Beatilful Day ! ", 500, 130);
           g.drawString("You Have Done your Lab :) ", 450, 170);
	}
	
	
	public int x = 0;
	public void drawLines(Graphics g){
		int LineWidth = 80;
		int lineHeight= 6;
		g.setColor(Color.LIGHT_GRAY);

		
		g.fillRect(30+x, 500 , LineWidth , lineHeight);
		g.fillRect(10+x, 570, LineWidth, lineHeight);
		
		g.fillRect(130+x, 500 , LineWidth , lineHeight);
		g.fillRect(100+x, 570, LineWidth, lineHeight);
		
		
		g.fillRect(230+x, 500 , LineWidth , lineHeight);
		g.fillRect(200+x, 570, LineWidth, lineHeight);
		
		
		g.fillRect(330+x, 500 , LineWidth , lineHeight);
		g.fillRect(300+x, 570, LineWidth, lineHeight);
		
		g.fillRect(430+x, 500 , LineWidth , lineHeight);
		g.fillRect(400+x, 570, LineWidth, lineHeight);
		
		g.fillRect(530+x, 500 , LineWidth , lineHeight);
		g.fillRect(500+x, 570, LineWidth, lineHeight);

		g.fillRect(630+x, 500 , LineWidth , lineHeight);
		g.fillRect(600+x, 570, LineWidth, lineHeight);

		g.fillRect(730+x, 500 , LineWidth , lineHeight);
		g.fillRect(700+x, 570, LineWidth, lineHeight);
		

		g.fillRect(830+x, 500 , LineWidth , lineHeight);
		g.fillRect(800+x, 570, LineWidth, lineHeight);
		
		
		
	
	}
	
	
	
	public void drawMountainOnBackground(Graphics g){
		
		
		// restting the xbound when background ends   
		if (xbound <= -1200)  xbound = 1200;
		if (xbound1 <= -1200) xbound1= 1200;
		
		
		// xbound = 0 , xbound1 starts at 1200
		g.drawImage(BackgroundImage, xbound, 0, null);
		g.drawImage(BackgroundImage, xbound1, 0, null);
				
	}
	
	
	
	
	public int skyRed=0;
	public int skyGreen=0;
	public int skyBlue=0;
	public int skyMode=0;;


	public void drawskyMode(Graphics g){
		
		// HELPMEIMPLEMENTINGTHIS:
		
		
		/**
		 * Hence:  
		 * 
		 * use if statement to change RGB COLOR
		 * 
		 * if skyeMode equal to 0 
		 * 		skyRed++;
		 * if skyRed  Greater than or equal 135
		 * 		skyMode = 1;
		 * if skyMode equal to one 
		 * 		if skyGreen less than or equal to 206
		 * 			skyGreen++;
		 * 		if skyBlue less than or equal to 250 
		 * 			skyBlue+=2;
		 * 
		 * 
		 * 
		 */
		 if (skyMode == 0) 
		  		skyRed++;
		 if (skyRed  >= 135)
		 		skyMode = 1;
		 if (skyMode == 1){ 
		 		if (skyGreen <= 206)
		  			skyGreen++;
		  		if (skyBlue <= 250) 
		  			skyBlue+=2;
		}
				
		g.setColor(new Color(skyRed,skyGreen,skyBlue));
		g.fillRect(0,0, 1200, 800);
		
	}
	
	
	

	public int sunx=30;
	public int suny=600;
	
	
	public void drawSunRising(Graphics g){
		
		// HELPMEIMPLEMENTINGTHIS:
		
		/**
		 * Hence: 
		 * 
		 * SunRise .. should be as Followed  
		 * 
		 * use if statement 
		 *   if suny between 600 and 200
		 *   	decrement suny by 3
		 *   else if suny between 200 and 5 
		 *   	decrement suny by 1
		 * 
		 * Draw Image using sun
		 * 	remember sun is already decleared as an Image 
		 * 	use sunx for x position
		 *      suny for y position 
		 *      sun  for Image    
		 */
		 if (suny <= 600 && suny >= 200)
		    	suny -=3;
		 else if (suny <= 200 && suny >= 5) 
		    	suny--;
                 Graphics2D g2d = (Graphics2D) g;
	         g2d.drawImage(sun, sunx  , suny, null);
		
	}
	
	public void paint(Graphics g){
	
		super.paint(g);
		Graphics2D g2d = (Graphics2D) g;
		
		
		// Drawing order Should as Followed 
		// 1. SkyMode
		// 2. Sunrise 
		// 3. Mountain
		// 4. Foggy 
		// 5. Road 
		// 6. Car 

		drawskyMode(g);
		drawSunRising(g);
		drawMountainOnBackground(g);
	
	
		// drawing foggy while game is running 
		// ERROR:
		// after xcloud = 600 
		//   foggy will be done 
		// should be improved .. 
		xcloud = xcloud - 2;
		g2d.drawImage(foggy, xcloud  , 0, null);

		
		// Road
		g2d.setColor(Color.DARK_GRAY);
		g2d.fillRect(0, 450, 1000, 200);
		g2d.setColor(Color.YELLOW);
		g2d.fillRect(0, 445, 1000, 5);

		drawLines(g);
	
		// mainchar..  
		g2d.drawImage(maincar.getImage(), maincar.getX(),maincar.getY(),this);
	
	
		// transparency on TOP
		//
		g.setColor(new Color(.1f, .1f, .1f, .1f));
		g.fillRect(0, 0 , 1000, 30);
		g.setColor(Color.white);
		g.drawString("Hello Guest! Click on this window to give it focus then use the arrow keys to move the car. <space> will pause.",10,20);
		g.setColor(new Color(1f, 1f, 1f, 1f));
		g2d.drawString("> Car Distance = "+maincar.getX()+"M/h", 700, 20);
		
		
		//g2d.drawString("Red"+skyRed+" Green "+skyGreen+" Blue"+skyBlue, 100, 100);
		
		if(suny <=  10 && skyRed == 135 && skyGreen == 207 && skyBlue == 252 )
		labIsDone(g);
		
	}
	
	   private Image dbImage;
	   private Graphics dbg;
	   
	public void update (Graphics g)
	   {
	      // initialize buffer
	      if (dbImage == null)
	      {
	         dbImage = createImage (this.getSize().width, 
	this.getSize().height);
	         dbg = dbImage.getGraphics ();
	      }

	      // clear screen in background
	      dbg.setColor (getBackground ());
	      dbg.fillRect (0, 0, this.getSize().width, this.getSize().height);

	      // draw elements in background
	      dbg.setColor (getForeground());
	      paint (dbg);

	      // draw image on the screen
	      g.drawImage (dbImage, 0, 0, this);

	   }
		
	public static void main(String[] args) {
		
	   JFrame frame = new JFrame("Sun Rise");
           //frame.add(new Board());
	   frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	   frame.setPreferredSize(new Dimension(1000,650));
           frame.setResizable(false);
	   Board myBoard = new Board();
	   frame.getContentPane().add(myBoard);
	   myBoard.init();
	   frame.pack();
	   frame.setVisible(true);
	   myBoard.start();
	}

}
