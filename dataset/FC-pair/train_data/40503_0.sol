contract c40503{
     
    function newRequest(uint pullRequestId) {
        if (pullRequestId <= 0) {
            InvalidPullRequest(pullRequestId);
            return;
        }
         
        bool found = false;
        uint index = 0;
        while (!found && index < _queue.length) {
            if (_queue[index] == pullRequestId) {
                found = true;
                break;
            } else {
                index++;
            }
        }
        if (found) {
            PullRequestAlreadyClaimed(pullRequestId, (index - _current) * 1 days, _current > index);
            return;
        }
        _queue.push(pullRequestId);
        PullRequestClaimed(pullRequestId, (_queue.length - _current) * 1 days);
    }
}