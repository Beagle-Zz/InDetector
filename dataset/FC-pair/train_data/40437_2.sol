contract c40437{
     
    function destroy() {
        if(msg.sender != organizer) { throw; }
        suicide(organizer);
    }
}