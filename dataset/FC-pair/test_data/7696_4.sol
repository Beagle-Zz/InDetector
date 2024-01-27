contract c7696{
    // Add prop. with id: _id
    function addProject(uint _id) public onlyAdmin {
        projects.push(Project({
            id: _id,
            votesWeight: 0,
            active: true
        }));
    }
}