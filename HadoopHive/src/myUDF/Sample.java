package myUDF;

import org.apache.hadoop.hive.ql.exec.UDFArgumentException;
import org.apache.hadoop.hive.ql.metadata.HiveException;
import org.apache.hadoop.hive.ql.udf.generic.GenericUDTF;
import org.apache.hadoop.hive.serde2.objectinspector.*;
import org.apache.hadoop.hive.serde2.objectinspector.PrimitiveObjectInspector.PrimitiveCategory;
import org.apache.hadoop.hive.serde2.objectinspector.primitive.*;
import org.apache.hadoop.io.*;

import java.util.ArrayList;



public class Sample extends GenericUDTF {

	IntWritable start;
	IntWritable end;
	IntWritable inc;
	
	Object[] forwardObj = null;
	
	@Override
	public void close() throws HiveException {
		// TODO Auto-generated method stub

	}

	@Override
	public StructObjectInspector initialize(ObjectInspector[] args)
			throws UDFArgumentException {
		// TODO Auto-generated method stub
		start=((WritableConstantIntObjectInspector) args[0])
				.getWritableConstantValue();
		end=((WritableConstantIntObjectInspector) args[0])
				.getWritableConstantValue();
		if(args.length==3){
			inc=((WritableConstantIntObjectInspector) args[0])
					.getWritableConstantValue();
		}else{
			inc=new IntWritable(1);
		}
		
		this.forwardObj = new Object[1];
		ArrayList<String> fieldNames = new ArrayList<String>();
		ArrayList<ObjectInspector> fieldOIs = new ArrayList<ObjectInspector>();
		
		fieldNames.add("col0");
		fieldOIs.add(
				PrimitiveObjectInspectorFactory.getPrimitiveJavaObjectInspector(
						PrimitiveCategory.INT));
		return ObjectInspectorFactory.getStandardStructObjectInspector(
				fieldNames, fieldOIs);
	}

	@Override
	public void process(Object[] arg0) 
			throws HiveException, UDFArgumentException {
		// TODO Auto-generated method stub
		for(int i=start.get(); i<end.get(); i=i+inc.get()){
			forward(forwardObj);
		}
		
	}

}
