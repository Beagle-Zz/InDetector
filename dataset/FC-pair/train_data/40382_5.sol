contract c40382{
     
    function destroy() {
        if(msg.sender != organizer) { throw; }
        suicide(organizer);
    }
}