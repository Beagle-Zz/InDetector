contract c9371{
    //Create new Forwarder
    function create_forwarder() public onlyOwnerOrCreator {
        address new_forwarder = new Forwarder();
        deployed_forwarders.push(new_forwarder);
        last_forwarder_created = new_forwarder;
        forwarders_count += 1;
    }
}