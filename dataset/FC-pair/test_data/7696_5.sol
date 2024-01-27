contract c7696{
    // Turns project ON and OFF
    function swapProject(uint _id) public onlyAdmin {
        for (uint p = 0; p < projects.length; p++){
            if(projects[p].id == _id){
                if(projects[p].active == true){
                    projects[p].active = false;
                }else{
                    projects[p].active = true;
                }
            }
        }
    }
}