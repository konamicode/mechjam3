var _finished = layer_sequence_is_finished(seqRivalAppears);
var _paused = layer_sequence_is_paused(seqRivalAppears);
if !_finished && _paused
{
	objMusicManager.StopMusic();
	layer_sequence_play(seqRivalAppears);
}
