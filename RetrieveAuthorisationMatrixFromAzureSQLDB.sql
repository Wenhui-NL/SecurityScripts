/* roles members overview */
SELECT DP1.name AS Role,   
   isnull (DP2.name, 'No members') AS Name   
FROM sys.database_role_members AS DRM  
RIGHT OUTER JOIN sys.database_principals AS DP1  
   ON DRM.role_principal_id = DP1.principal_id  
LEFT OUTER JOIN sys.database_principals AS DP2  
   ON DRM.member_principal_id = DP2.principal_id  
WHERE DP1.type = 'R'
ORDER BY DP1.name;



/* securables permissions overview */
select  princ.name as Name
,       princ.type_desc as Type
,       perm.permission_name as Permission
,       perm.state_desc as State
,       perm.class_desc as Class
,       object_name(perm.major_id) as ObjectName
from    sys.database_principals princ
left join
        sys.database_permissions perm
on      perm.grantee_principal_id = princ.principal_id
where princ.type_desc in ('EXTERNAL_USER', 'EXTERNAL_GROUP')
