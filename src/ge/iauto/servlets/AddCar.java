package ge.iauto.servlets;

import ge.iauto.server.PersistenceService;
import ge.iauto.server.model.Car;
import ge.iauto.server.model.User;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class AddingCars
 */
@WebServlet("/AddCar")
public class AddCar extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user")==null){
			request.getRequestDispatcher("log-in.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("add-car.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("user") == null){
			request.getRequestDispatcher("log-in.jsp").forward(request, response);
		}else{
			PersistenceService service = new PersistenceService();
			Car car = new Car();
			car.setUser((User)request.getSession().getAttribute("user"));
			car.setUploaddate(new Date());
			
			File file;
			String filePath = getServletContext().getInitParameter("file-upload");
			DiskFileItemFactory factory = new DiskFileItemFactory();
			factory.setRepository(new File("d:\\iauto"));
			ServletFileUpload upload = new ServletFileUpload(factory);
			try {
				List fileItems = upload.parseRequest(request);
				Iterator i = fileItems.iterator();
				int index = 1;
				while(i.hasNext()){
					FileItem fi = (FileItem)i.next();
					if(!fi.isFormField()){
						// Get the uploaded file parameters
			            String fileName = fi.getName();
			            long sizeInBytes = fi.getSize();
			         // Write the file
			            if(!fileName.isEmpty() && sizeInBytes <= 160000){
			            	if( fileName.lastIndexOf("\\") >= 0 ){
			            		file = new File( filePath + fileName.substring( fileName.lastIndexOf("\\"))) ;
			            	}else{
			            		file = new File( filePath + fileName.substring(fileName.lastIndexOf("\\")+1)) ;
			                	}
			        //converting into byte[]
			            	fi.write(file);
			            	byte[] bFile = new byte[(int) file.length()];   
			            	FileInputStream fileInputStream = new FileInputStream(file);
			            	fileInputStream.read(bFile);
			            	fileInputStream.close();
			            	switch(index){
			            	case 1: car.setPhoto1(bFile);
			            			index++;
			            		    break;
			            	case 2: car.setPhoto2(bFile);
			            			index++;
	            		    		break;
			            	case 3: car.setPhoto3(bFile);
			            			index++;
			            			break;
			            	case 4: car.setPhoto4(bFile);
			            			index++;
			            			break;
			            	case 5: car.setPhoto5(bFile);
					            	index++;		
					            	break;
			            	case 6: car.setPhoto6(bFile);
				            	index++;		
				            	break;
			            	}
			            	
			            }
			            // fi is ordinary input field
					}else{
						String fieldName = fi.getFieldName();
						String parameter = new String(fi.getString().getBytes("iso-8859-1"),"UTF-8");
						if(fieldName.equals("category_id")){
							car.setCategory(service.findCategory(Long.valueOf(parameter)));
						}else if(fieldName.equals("carmake_id")){
							car.setCarmake(service.findCarMake(Long.valueOf(parameter)));
						}else if(fieldName.equals("model_id")){
							car.setCarmodel(service.findCarModel(Long.valueOf(parameter)));
						}else if(fieldName.equals("location_id")){
							car.setLocation(service.findLocation(Long.valueOf(parameter)));
						}else if(fieldName.equals("prod_year")){
							car.setYear(Integer.valueOf(parameter));
						}else if(fieldName.equals("prod_month")){
							car.setMonth(Integer.valueOf(parameter));
						}else if(fieldName.equals("car_run")){
							car.setKilometer(parameter);
						}else if(fieldName.equals("car_run_dim")){
							car.setKilometer(car.getKilometer() + parameter);
						}else if(fieldName.equals("door_type_id")){
							car.setDoors(parameter);
						}else if(fieldName.equals("airbags")){
							car.setAirbag(parameter);
						}else if(fieldName.equals("color_id")){
							car.setColor(parameter);
						}else if(fieldName.equals("gear_type_id")){
							car.setGearbox(parameter);
						}else if(fieldName.equals("client_nm")){
							car.setUsername(parameter);
						}else if(fieldName.equals("abs")){
							car.setAbs(true);
						}else if(fieldName.equals("el_windows")){
							car.setWindow(true);
						}else if(fieldName.equals("climat_control")){
							car.setClimat(true);
						}else if(fieldName.equals("disks")){
							car.setWheel(true);
						}else if(fieldName.equals("hatch")){
							car.setTopwindow(true);
						}else if(fieldName.equals("board_comp")){
							car.setComputer(true);
						}else if(fieldName.equals("alarm")){
							car.setSequrity(true);
						}else if(fieldName.equals("price")){
							car.setPrice(Integer.valueOf(parameter));
						}else if(fieldName.equals("currency_id")){
							car.setCurrency(parameter);
						}else if(fieldName.equals("customs_passed")){
							car.setGanbajebuli(true);
						}else if(fieldName.equals("changable")){
							car.setChangable(true);
						}else if(fieldName.equals("is_auction")){
							car.setSaleonauction(true);
						}else if(fieldName.equals("engine_volume")){
							car.setEngine(Double.valueOf(parameter));
						}else if(fieldName.equals("cylinders")){
							car.setCylinder(parameter);
						}else if(fieldName.equals("drive_type_id")){
							car.setActionwheel(parameter);
						}else if(fieldName.equals("fuel_type_id")){
							car.setFuel(parameter);
						}else if(fieldName.equals("right_wheel")){
							car.setRightsteeringwheel(true);
						}else if(fieldName.equals("has_turbo")){
							car.setTurbo(true);
						}else if(fieldName.equals("client_phone_1")){
							car.setTelephone(parameter);
						}else if(fieldName.equals("obstacle_indicator")){
							car.setParkcontrol(true);
						}else if(fieldName.equals("condintioner")){
							car.setConditioner(true);
						}else if(fieldName.equals("leather")){
							car.setLeather(true);
						}else if(fieldName.equals("nav_system")){
							car.setNavigation(true);
						}else if(fieldName.equals("central_lock")){
							car.setCentrallock(true);
						}else if(fieldName.equals("chair_warming")){
							car.setSavardzlisgatboba(true);
						}else if(fieldName.equals("hydraulics")){
							car.setHydraulics(true);
						}else if(fieldName.equals("discription")){
							car.setDescribtion(parameter);
						}else if(fieldName.equals("vin")){
							car.setVincode(parameter);
						}
					}
				}
						
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			service.saveCar(car);
		}	
	}

}
