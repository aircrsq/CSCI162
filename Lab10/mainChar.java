import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.Toolkit;
import java.awt.event.KeyEvent;

import javax.swing.*;


public class mainChar {

	
	private int xPos;
	private int yPos;
	private int xVelocity;
	private int yVelocity;
	private Image car;
	private int distance;
	private int carWidth;
	private int carHeight;
	public int speed;
	
	public mainChar() {
		
		car = Toolkit.getDefaultToolkit().getImage(getClass().getResource("Mcar.png")); 			
		carHeight 	= 80;
		carWidth 	= 80;
		init();

	}
	public void init() {

		
		distance 	= 0;
		distance 	= 0;
		xVelocity 	= 0;
		yVelocity 	= 0;
		xPos		= 80;
		yPos 		= 400;
		speed 		= 5;
		

	}

		
	public void moveLeft(){
		xPos-= speed;
	}
	
	
	public void moveRight(){
	
		xPos+= speed;
		
		
	}
	
	public void moveUp(){
		yPos-=5;
	}
	
	
	public void moveDown(){
		
		yPos+=5;
	}
	
	
	public int getX() {
		xPos++;
		if (xPos >= 850){
			setX(5);
		}
		
		return xPos;
		
	}
	public int getY() {
		return yPos;
	
	}
	public int getCarWidth() {
		return carWidth;
		
	}
	public int getCarHieght() {
		return carHeight;
	
	}

	
	public void setY(int n){
		this.yPos = n; 
	}	
	
	public void setX(int n){
		this.xPos = n; 
	}

	public Image getImage(){
		return car;
	}
	
	
	public Rectangle bound(){
		return (new Rectangle(xPos,yPos, carWidth,carHeight));
		
	}
	
	
	

	
}
