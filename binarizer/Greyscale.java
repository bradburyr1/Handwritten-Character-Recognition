import java.awt.image.*;
import java.io.*;
import javax.imageio.*;
import java.awt.*;

public class Greyscale {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		BufferedImage img = null;
			try {
			    img = ImageIO.read(new File("R.png"));
			} catch (IOException e) {
			}
			
			//System.out.println("Height: " + img.getHeight() + "\nWidth: " + img.getWidth());
			/////////////////////////////////////////////////////////////////////////////////////
			//For this next part, credit for the original code goes to:
			//http://developer.bostjan-cigan.com/java-image-binarization/
			
			int red, green, blue;
		    for(int j=0; j<img.getHeight(); j++) {
		        for(int i=0; i<img.getWidth(); i++) {
		 
		            red = new Color(img.getRGB(i, j)).getRed();
		            green = new Color(img.getRGB(i, j)).getGreen();
		            blue = new Color(img.getRGB(i, j)).getBlue();
		 
		            red = (int) (0.21 * red + 0.71 * green + 0.07 * blue);
		            
		            red = (red - 252) * -1;
		            
		            System.out.print(red + " ");
		            // Return back to original format
		            //newPixel = colorToRGB(alpha, red, red, red);
		 
		            // Write pixels into image
		            //lum.setRGB(i, j, newPixel);`
		            }
		        System.out.print("\n");
		        }
		    }
	}