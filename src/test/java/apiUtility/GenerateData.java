package apiUtility;

public class GenerateData {
public static String getEmail() {
		
		String randomName = "javaClassStudent";
		String provider = "@tekschool.us";
		int random = (int)(Math.random()* 10000);
		String allvalue = randomName  + random + provider;
		return allvalue;
	}		
	   // public static void main(String[] args) {
		
//		GenerateData data = new GenerateData();
//		System.out.println(data.getEmail());
//		
//	}

	    public static String getPhnoneNumber() {
	    	String phoneNumber = "804";
	    	
	    	for (int i = 0; i < 7; i++) {
	    		phoneNumber += (int)(Math.random()*10);
	  	
	  }
	    	return phoneNumber;
	    }
	    	
	    		String number = getPhnoneNumber();
	    		
//	    System.out.println(number);
//	    System.out.println(number.length());
//	    
	    	
	    	
	    	public static String getLicense() {
	    		
	    		String Littering = "VAL-";
	    		String Litteing1 = "3";
	    		int random = (int)(Math.random()* 109);
	    		String info = Littering + random + Litteing1;
	    		return info;
	    	}
	    		public static void main(String[] args) {
	    	String number = getLicense();
	      System.out.println(number);
       
    	   
       }
       }
	




