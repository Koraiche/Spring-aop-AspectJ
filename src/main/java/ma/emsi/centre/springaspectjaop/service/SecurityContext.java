package ma.emsi.centre.springaspectjaop.service;



public class SecurityContext {
    public static String username= "";
    public static String password= "";
    public static String[] roles= {};

    public static void authenticate(String u, String p, String[] r){
        if(u.equals("root")&&p.equals("root")){
            username = u ;
            password = u ;
            roles = r;
        }else{
            throw new RuntimeException("Access Denied ! ");
        }
    }

    public static boolean hasRole(String r) {
        for (String role: roles) {
             if(r.equals(role)){
                 return true;
             }
        }
        return false;
    }
}
