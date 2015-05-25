package controller;
import java.text.*;
import java.util.*;

import javax.servlet.http.HttpServletRequest;

import mat.IFesBes1;
import mat.IFrontConnector;
import mat.Matt;
import mat.MattData;
import mat.Notification;
import mat.Person;
import mat.Response;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@Scope("session")
@RequestMapping({"/"})
public class MatApplication {
	
	private Person user;
	String userName;
	String userEmail;
	Matt oldMatt=null;

	static private int GMT_TIME_ZONE=41;
	
	@Autowired
	IFesBes1 ifesbes1;
	@Autowired
	IFrontConnector connector;

	
	@RequestMapping({"/"})
	public String login() {
		return "newloginon";
	}
	@RequestMapping({"/registry"})
	public String registry(Model model){
		model.addAttribute("reg",true);
		return "newaccout_setting";
	}
	@RequestMapping({"/person"})
	public String person(@RequestParam ("firstname") String firstName,@RequestParam ("lastname") String lastName,
			@RequestParam ("email") String email,@RequestParam ("password") String password,Model model) {
		Person pers = new Person(firstName,lastName, email, password, GMT_TIME_ZONE);
		
		if (ifesbes1.setProfile(pers)==Response.IN_ACTIVE) {
			model.addAttribute("email","EMAIL incorrect!");
			return "registry";}	
		return "newloginon";
	}
	@RequestMapping({"/activate"})
	 public String activate(HttpServletRequest request){
		String user=request.getParameter("user");
		String hash=request.getParameter("hash");
		ifesbes1.setActive(user,hash);
	   return "newloginon";
	 }
	@RequestMapping({"/home"})
	public String home(@RequestParam ("name") String name,@RequestParam ("password") String password,Model model) {
		if (ifesbes1.matLogin(name,password)==Response.NO_PASSWORD_MATCHING || ifesbes1.matLogin(name,password)==Response.NO_REGISTRATION || ifesbes1.matLogin(name,password)==Response.IN_ACTIVE){
			return "loginon";}
		user=ifesbes1.getProfile(name);
		userName=user.getEmail();
		userEmail=user.getEmail();
		model.addAttribute("userName",userName);
		model.addAttribute("matt",ifesbes1.getMattNames(userName));
		return "newhome";
	}
	@RequestMapping({"/homereturn"})
	public String homereturn (Model model){
		model.addAttribute("userName",userName);
		model.addAttribute("matt",ifesbes1.getMattNames(userName));
		return "newhome";	
	}
	@RequestMapping({"/removematt"})
	public String removeMATT(HttpServletRequest request,Model model){
		String mattIdStr=request.getParameter("table");
		int mattId=Integer.parseInt(mattIdStr);
		ifesbes1.removeMatt(mattId);
		return homereturn(model);
	}
	@RequestMapping(value = "newJson", method = RequestMethod.GET)
	public @ResponseBody String newJson(@RequestParam(value = "mattjson", required = false) String mattjson,@RequestParam(value = "plus", required = false) String plus){
		String mattToJSON=null;
		System.out.println("получил json"+mattjson);
		oldMatt.weekFromBrowser(mattjson);
		Calendar cal=oldMatt.currentMonday;
		if(plus.equals("plus")){cal.add(Calendar.DAY_OF_YEAR, 7);}
		if(plus.equals("minus")){cal.add(Calendar.DAY_OF_YEAR, -7);}
		mattToJSON = oldMatt.weekToBrowser(cal.getTime());  
		System.out.println("отдалл json"+mattToJSON);
		System.out.println();
	return mattToJSON;
	}

	@RequestMapping(value = "ajaxjson", method = RequestMethod.POST)
	public @ResponseBody  void ajaxjson(@RequestParam(value = "mattjson", required = false) String mattjson){
		oldMatt.weekFromBrowser(mattjson);
	}
	@RequestMapping({"/saveMatt"})
	public String saveMattData(Model model){
		ifesbes1.saveMatt(oldMatt,userEmail);
		return  homereturn (model);
	}
	@RequestMapping({"/upload_matt"})
	public String upload_matt(Model model){
		int tabl=ifesbes1.saveMatt(oldMatt,userEmail);
		List<String> uploadSN = new ArrayList<String>();
		uploadSN.add(userName);
		oldMatt.getData().setUploadCalendars(IFrontConnector.GOOGLE, uploadSN);
		connector.uploadMatt(userName, oldMatt);
		return action_edit(Integer.toString(tabl),model);
	}

	@RequestMapping({"/action_edit"})
	public String action_edit (@RequestParam ("table") String mattId4Matt,Model model) {
		  int tableId=Integer.parseInt(mattId4Matt);
		  oldMatt=ifesbes1.getMatt(tableId);
		  String namecalendar=oldMatt.getData().getName();
		  String mattToJSON = oldMatt.weekToBrowser(startDate(null));
		  model.addAttribute("userName",userName);
		  model.addAttribute("matJSON",mattToJSON);
		  model.addAttribute("namecalendar",namecalendar);
		  model.addAttribute("idmat",mattId4Matt);
		return "newcreateMatt";
	}
	@RequestMapping({"/newmatt"})
	public String createMatt2(@RequestParam ("namecalendar") String namecalendar,@RequestParam ("timeSlot") int timeSlot,Model model){
		String mattToJSON=null;
		Date startDate = startDate(null);
		int startHour = 0;
		int endHour = 24;
		String password = null;
		mat.MattData data = new MattData(namecalendar,7,startDate,startHour,endHour,timeSlot,password);
		  ArrayList<Boolean> newTabList=new ArrayList<Boolean>();
		  int slotsNumber=(60/timeSlot)*(endHour-startHour)*7;
		  for(int i=0;i<slotsNumber;i++){
		   newTabList.add(true);
		  }
		  oldMatt=new Matt();
		  oldMatt.setData(data);
		  oldMatt.setSlots(newTabList);
		  mattToJSON = oldMatt.weekToBrowser(startDate);
		model.addAttribute("userName",userName);
		model.addAttribute("matJSON",mattToJSON);
		model.addAttribute("namecalendar",namecalendar);
		return "newcreateMatt";
	}
	private static Calendar getFirstWeekDayTime(Calendar calendar){
		int weekDay = calendar.get(Calendar.DAY_OF_WEEK);		
	    switch(weekDay) {
	    case 1:
	        weekDay = -6;
	        break;
	    case 2:
	        weekDay = 0;
	        break;
	    case 3:
	        weekDay = -1;
	        break;
	    case 4:
	        weekDay = -2;
	        break;
	    case 5:
	        weekDay = -3;
	        break;
	    case 6:
	        weekDay = -4;
	        break;
	    case 7:
	        weekDay = -5;
	        break;
	    }
	    calendar.add(Calendar.DAY_OF_MONTH, weekDay);
	    calendar.set(Calendar.HOUR_OF_DAY, 0);
		calendar.set(Calendar.HOUR, 0);
		calendar.set(Calendar.MINUTE, 0);
		calendar.set(Calendar.SECOND, 0);
		calendar.set(Calendar.MILLISECOND, 0);
		calendar.set(Calendar.AM_PM, Calendar.AM);
		return calendar;	
	}
private Date startDate(Date date) {
	if (date==null) date = new Date();
	Calendar calendar= new GregorianCalendar();
	calendar.setTime(date);	
	Date tmp=getFirstWeekDayTime(calendar).getTime();
	 
	return tmp;
	}
private Date endDate(Date date) {
	if (date==null)date= new Date();
	Calendar calendar= new GregorianCalendar();
	calendar.setTime(date);	
	calendar = getFirstWeekDayTime(calendar);
    calendar.add(Calendar.DAY_OF_MONTH, 6);
	return calendar.getTime();
	}
@RequestMapping({"/accountsettings"})
public String accountSettings (Model model) {
	 String[] dataGoogle = new String[0];
	 String[] authorizedSN = null;
	 HashMap<String, Boolean> authSN = new HashMap<String, Boolean>();
//Add Authorize attributes
     try {
    	 dataGoogle = connector.getApplicationData(IFrontConnector.GOOGLE);
     } catch (Exception e) {
    	 e.getMessage();
     }
     String clientIDGoogle = dataGoogle[IFrontConnector.INDEX_ID];
     StringBuffer scopesGoogle = new StringBuffer();
     for (int i = IFrontConnector.INDEX_SCOPES; i < dataGoogle.length; i++) {
    	 scopesGoogle.append(dataGoogle[i]);
    	 scopesGoogle.append(" ");
     }
     model.addAttribute("idGoogle", clientIDGoogle);
     model.addAttribute("scopesGoogle", scopesGoogle);
//Add Social Networks attributes
     try {
    	 authorizedSN = connector.getAuthorizedSocialNames(userName);
    	 user = ifesbes1.getProfile(userName);
     } catch (Exception e) {
    	 e.getMessage();
     }
	 model.addAttribute("GoogleAuth", "disabled");
	 model.addAttribute("FacebookAuth", "disabled");
	 model.addAttribute("AppleAuth", "disabled");
	 model.addAttribute("TwitterAuth", "disabled");
	 model.addAttribute("WindowsAuth", "disabled");
     for(int i=0; i<authorizedSN.length; i++){
//    	 model.addAttribute(authorizedSN[i]+"Auth", "");
    	 model.addAttribute(authorizedSN[i]+"Ch", "checked");
    	 authSN.put(authorizedSN[i], true);	    	 
     }
//Add Person attributes
     model.addAttribute("firstname", user.getName());
     model.addAttribute("lastname", user.getFamilyName());
     model.addAttribute("email", user.getEmail());
     model.addAttribute("prof_firstname", user.getName());
     model.addAttribute("prof_lastname", user.getFamilyName());
     model.addAttribute("prof_email", user.getEmail());
     model.addAttribute("prof_phone", "");
     model.addAttribute("tz"+user.getTimeZone(), "selected");
     model.addAttribute("reg",false);
     return "newaccout_setting";
}
@RequestMapping({"/savesettings_profile"})
public String savesettings_profile(HttpServletRequest request, Model model) {
	int resultSave = -1;
	String name = request.getParameter("prof_firstname");
	String lastname = request.getParameter("prof_lastname");
	String email = request.getParameter("prof_email");
	String password = request.getParameter("prof_password");
	String password1 = request.getParameter("prof_password1");
	String timeZoneStr = request.getParameter("timeZone");
	if(timeZoneStr!=null) {
		int timeZone = Integer.parseInt(timeZoneStr);
		user.setTimeZone(timeZone);
	}
	if(name!=null && !name.equals("")) user.setName(name);
	if(lastname!=null && !lastname.equals("")) user.setFamilyName(lastname);;
//	if(email!=null && email.contains("@")) user.setEmail(email);
	if(password!=null && !password.equals("") && password.equals(password1))
		user.setPassword(password);
	try {
		resultSave = ifesbes1.updateProfile(user);
	} catch (Exception e) {
		model.addAttribute("exception", "don't update profile");
	}
	return accountSettings (model);
}
@RequestMapping({"/resauto"})
public String resultAuthorization(String code, String access_token, Model model) {
	if (code!=null) {
		try {
			connector.authorize(userName, IFrontConnector.GOOGLE, code);
		} catch (RuntimeException e) {
			model.addAttribute("error", e.getMessage());
			return "error_form";
		}
	}
	return accountSettings(model);
}

@RequestMapping(value = "email", method = RequestMethod.GET)
public @ResponseBody String setEmail(@RequestParam(value = "email", required = false) String email){
	StringBuffer buf= new StringBuffer();
	buf.append(ifesbes1.ifEmailExistsInDB(email));
	return buf.toString();	
}


}
