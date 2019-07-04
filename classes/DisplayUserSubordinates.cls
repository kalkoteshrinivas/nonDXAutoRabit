public class DisplayUserSubordinates{
String sUserId;
final static String CONST_SYS_ADMIN_PROFILE = 'System Administrator';
Id idLoggedInUserProfielId;    
public Boolean bIsSystemAdminLoggedIn{get;set;}
Profile oProfile;
public User oUserTemp                    {get;set;}
public List<User> lstUsers{get;set;}    
    public DisplayUserSubordinates()
    {
        bIsSystemAdminLoggedIn = false;
        //get logged in user profile id
        idLoggedInUserProfielId = UserInfo.getProfileId();
        oProfile = [SELECT Name FROM Profile Where Id =: idLoggedInUserProfielId];
        //if possible use ternary operator
        //check logged in user is system admin
        if(oProfile.Name == CONST_SYS_ADMIN_PROFILE)
        {
            bIsSystemAdminLoggedIn = true;
        }
        UserDetailHelper oUserDetailHelper = new UserDetailHelper();
        sUserId = ApexPages.currentPage().getParameters().get('UserId');    
        if(String.isEmpty(sUserId))
        {
            sUserId = UserInfo.getUserId();
        }
        lstUsers = UserDetailHelper.getSubordinateUsers((Id)sUserId );
    }
    
    public void showSelectedUserSubordinates()
    {
        system.debug('user::' + oUserTemp);
        if(oUserTemp != null)
            lstUsers = UserDetailHelper.getSubordinateUsers(oUserTemp.ManagerId );
    }

}