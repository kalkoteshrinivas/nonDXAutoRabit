trigger AccountChangeEventTrigger on AccountChangeEvent (after insert) {
	system.debug('trigger new' + Trigger.new);
}