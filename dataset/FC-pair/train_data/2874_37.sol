contract c2874{
    /// @dev performs only allowed state transitions
    function changeState(State _newState)
        external
        onlyController
    {
        assert(m_state != _newState);
        if (State.GATHERING == m_state) {   assert(State.REFUNDING == _newState || State.SUCCEEDED == _newState); }
        else assert(false);
        m_state = _newState;
        StateChanged(m_state);
    }
}