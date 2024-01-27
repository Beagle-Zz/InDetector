contract c7696{
    // Returns proj. weight
    function projectWeight(uint _id) public constant returns(uint PW){
        for (uint p = 0; p < projects.length; p++){
            if(projects[p].id == _id){
                return projects[p].votesWeight;
            }
        }
    }
}