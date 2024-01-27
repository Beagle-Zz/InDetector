contract c7696{
    // Returns proj. status
    function projectActive(uint _id) public constant returns(bool PA){
        for (uint p = 0; p < projects.length; p++){
            if(projects[p].id == _id){
                return projects[p].active;
            }
        }
    }
}