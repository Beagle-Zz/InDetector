contract c10059{
      /**
      * function to return all the users
      **/
      function getAllUsers(bool fetch) public constant returns (address[]) 
      {
          return allUsers;
      } 
}