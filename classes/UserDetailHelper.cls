public class UserDetailHelper{
    
    public static List<User> getSubordinateUsers(Id userToGetSubordinates)
    {
        Set<Id> subordinateRoles = getSubordinateRoles(userToGetSubordinates);
        List<User> subordinateUsers = [select id,Name,UserRole.Name from User where UserRoleId in :subordinateRoles];
        return subordinateUsers;
    }
    
    public static Set<Id> getSubordinateRoles(Id userId){
        // get requested user's role
        Id roleId = [select UserRoleId from User where Id = :userId].UserRoleId;
        // get all of the roles underneath the user
        Set<Id> allSubRoleIds = getAllSubRoleIds(new Set<ID>{roleId});
        return allSubRoleIds;
    }

    public static Set<ID> getAllSubRoleIds(Set<ID> roleIds) 
    {
        Set<ID> currentRoleIds = new Set<ID>();

        // get all of the roles underneath the passed roles
        for(UserRole userRole :[select Id from UserRole where ParentRoleId IN :roleIds AND ParentRoleID != null])
        {
            currentRoleIds.add(userRole.Id);
        }

        // we need to get more rolls by recursion
        if(currentRoleIds.size() > 0)
        {
            currentRoleIds.addAll(getAllSubRoleIds(currentRoleIds));
        }
        return currentRoleIds;
    }

}