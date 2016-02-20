package ml1;
import java.util.ArrayList;

import weka.classifiers.functions.LinearRegression;
import weka.core.Instance;
import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource;

public class mlclass {

	
	
	
	
	 public static void main(String[] args){
	 // Read all the instances in the file (ARFF, CSV, XRFF, ...)
	 DataSource source;

	try {
		source = new DataSource("./hwk2data.csv");      /*  1.2135 * X +
	                                                      -4.2115   */
		Instances instances = source.getDataSet();
		instances.setClassIndex(instances.numAttributes() - 1);
		 System.out.println(instances.firstInstance().value(1));
		 // Print header and instances.
		 System.out.println("\nDataset:\n");
		 System.out.println(instances);
		 /*
		 LinearRegression model=new LinearRegression();
		 model.buildClassifier(instances);
		 System.out.println(model);
		 Instance myHouse = instances.lastInstance();
		 double price = model.classifyInstance(myHouse);
		 System.out.println("My house ("+myHouse+"): "+price);*/
		
		double c2=0,c=0,a=0.00012;
		 
		double theta0=0;
		double theta1=0;
		double theta2=0;
			 int num=0;
			 double sumnt0=0,intsum0=0,intsum1=0,intsum2=0;
			 double sumnt1=0;
			 double sumnt2=0;
			do{
				 c=costFunction(instances,theta0,theta1,theta2);
				
			 for(int i=1;i<instances.numInstances();i++){
				 Instance is=instances.instance(i);
				sumnt0=sumnt0+(( theta0+(theta1*is.value(0)) + (theta2*is.value(0)*is.value(0)) )-is.value(1));
				
			 }
			
			  intsum0=(((double)1/instances.numInstances() )*sumnt0);
			 System.out.println(intsum0);
			 for(int i=1;i<instances.numInstances();i++){
				 Instance is=instances.instance(i);
					sumnt1=sumnt1+((( theta0+( theta1*is.value(0) )+(theta2*is.value(0)*is.value(0)) )-is.value(1) )*is.value(0) );
				 }
			  intsum1=(((double)1/instances.numInstances())*sumnt1);
			  
			  
			  
			  for(int i=1;i<instances.numInstances();i++){
					 Instance is=instances.instance(i);
						sumnt2=sumnt2+((( theta0+( theta1*is.value(0) )+(theta2*is.value(0)*is.value(0)) )-is.value(1) )*is.value(0)*is.value(0) );
					 }
				  intsum2=(((double)1/instances.numInstances())*sumnt2);
			  
			  
			  
			 theta0 = theta0 -(a*intsum0);
			 System.out.println(theta0);
			 theta1 = theta1 -(a*intsum1);
			 System.out.println(theta1);
			 
			 theta2 = theta2 -(a*intsum2);
			 System.out.println(theta2);
			 
			 
			  c2=costFunction(instances,theta0,theta1,theta2);
			  num++;
			}while(num<1500 || c2<c ); 
			
			System.out.println(c+" ----- "+c2);
			 theta0 = theta0 +(a*intsum0);
			 theta1 = theta1 +(a*intsum1);
			 theta2 = theta2 +(a*intsum2);
			System.out.println(theta0+" ----- "+theta1+"------"+theta2);
			double input=7.00;
			double newprofit=theta0+ (theta1*input) + (theta2*input*input);
			System.out.println("The Profit for a Population of 6.46 Million is :"+newprofit);
		 
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 
	
	
	 

}
	 
	public static double costFunction(Instances i,double t0,double t1,double t2){
		 double cost=0;
		 double interm=0;
		for(int i1=1; i1<i.numInstances();i1++){
			Instance is=i.instance(i1);
			System.out.println(is.value(0)+" ---- "+is.value(1));
			double er=(t0+t1*is.value(0) +(t2*is.value(0)*is.value(0)) )-is.value(1);
			
		 interm=interm+ (er*er);
		}
		 cost=((double)0.5/i.numInstances())*interm;
		 return cost;
	 }
	
}
