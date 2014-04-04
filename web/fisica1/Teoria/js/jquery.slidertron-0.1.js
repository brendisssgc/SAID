(function($) {

	jQuery.fn.slidertron = function(options) {
		
		var settings = jQuery.extend({
			selectorParent:		jQuery(this)
		}, options);
		
		return jQuery.slidertron(settings);
	}

	jQuery.slidertron = function(options) {

		// Settings
		
			var settings = jQuery.extend({
			
				selectorParent:						null,						// If a jQuery object, all selectors will be restricted to its scope. Otherwise, all selectors will be global.
				
				// Selectors
				
					viewerSelector:					null,						// Viewer selector
					slidesSelector:					null,						// Slides selector
					slidernavNextSelector:				null,						// 'Next' selector
					slidernavPreviousSelector:			null,						// 'Previous' selector
					slidernavFirstSelector:				null,						// 'First' selector
					slidernavLastSelector:				null,						// 'Last' selector
					slidernavStopAdvanceSelector:			null,						// 'Stop Advance' selector
					slidernavPlayAdvanceSelector:			null,						// 'Play Advance' selector

				// General settings

					speed:							'fast',						// Transition speed (0 for instant, 'slow', 'fast', or a custom duration in ms)
					navWrap:						true,						// Wrap navigation when we navigate past the first or last slide
					seamlessWrap:					true,						// Seamlessly wrap slides
					slideradvanceDelay:					0,							// Time to wait (in ms) before automatically advancing to the next slide (0 disables advancement entirely)
					slideradvanceResume:					0,							// Time to wait (in ms) before resuming advancement after a user interrupts it by manually navigating (0 disables resuming advancement)
					advanceNavActiveClass:			'active'					// Active advancement navigation class

			}, options);
			
		// Variables

			// Operational stuff
		
				var isConfigured = true,
					isLocked = false,
					isAdvancing = false,
					isSeamless = false,
					list = new Array(),
					currentIndex = false,
					timeoutID;

			// jQuery objects

				var __slides,
					__viewer,
					__navFirst,
					__navLast,
					__navNext,
					__navPrevious,
					__navStopAdvance,
					__navPlayAdvance;

		// Functions
			
			function getElement(selector, required)
			{
				var x;
				
				try
				{
					if (selector == null)
						throw 'is undefined';
			
					if (settings.selectorParent)
						x = settings.selectorParent.find(selector);
					else
						x = jQuery(selector);
					
					if (x.length == 0)
						throw 'does not exist';
					
					return x;
				}
				catch (error)
				{
					if (required == true)
					{
						alert('Error: Required selector "' + selector + '" ' + error + '.');
						isConfigured = false;
					}
				}
				
				return null;
			}

			function advance()
			{
				if (settings.slideradvanceDelay == 0)
					return;
			
				if (!isLocked)
					nextSlide();

				timeoutID = window.setTimeout(advance, settings.slideradvanceDelay);
			}

			function initializeAdvance()
			{
				if (settings.slideradvanceDelay == 0)
					return;

				if (__navPlayAdvance)
					__navPlayAdvance.addClass(settings.advanceNavActiveClass);
				
				if (__navStopAdvance)
					__navStopAdvance.removeClass(settings.advanceNavActiveClass);

				isAdvancing = true;
				timeoutID = window.setTimeout(advance, settings.slideradvanceDelay);
			}
			
			function interruptAdvance()
			{
				if (!isAdvancing)
					return;

				if (settings.slideradvanceDelay == 0)
					return;

				window.clearTimeout(timeoutID);

				if (settings.slideradvanceResume == 0)
					return;

				timeoutID = window.setTimeout(advance, settings.slideradvanceResume);
			}
			
			function stopAdvance()
			{
				if (settings.slideradvanceDelay == 0)
					return;

				if (!isAdvancing)
					return;
			
				isAdvancing = false;
				window.clearTimeout(timeoutID);
			}
			
			function playAdvance(skip)
			{
				if (settings.slideradvanceDelay == 0)
					return;

				if (isAdvancing)
					return;

				isAdvancing = true;

				if (skip)
					timeoutID = window.setTimeout(advance, settings.slideradvanceDelay);
				else
					advance();
			}
			
			function firstSlide()
			{
				switchSlide((isSeamless ? 1 : 0));
			}
			
			function lastSlide()
			{
				switchSlide((isSeamless ? list.length - 2 : list.length - 1));
			}

			function nextSlide()
			{
				if (currentIndex < list.length - 1)
					switchSlide(currentIndex + 1);
				else if (settings.navWrap || isAdvancing)
					switchSlide(0);
			}
			
			function previousSlide()
			{
				if (currentIndex > 0)
					switchSlide(currentIndex - 1);
				else if (settings.navWrap)
					switchSlide(list.length - 1);
			}

			function switchSlide(index)
			{
				// Check locking status (so another switch can't be initiated while another is in progress)

				if (isLocked)
					return false;
					
				isLocked = true;

				if (currentIndex === false)
				{
					currentIndex = index;
					__reel.css('left', -1 * list[currentIndex].x);
					isLocked = false;
				}
				else
				{
					var diff, currentX, newX;
					
					currentX = list[currentIndex].x;
					newX = list[index].x;
					diff = currentX - newX;

					__reel.animate({ top: '+=' + diff }, settings.speed, 'swing', function() {
						currentIndex = index;

						if (list[currentIndex].realIndex !== false)
						{
							currentIndex = list[currentIndex].realIndex;
							__reel.css('left', -1 * list[currentIndex].x);
						}

						isLocked = false;
					});
				}
			}

			function initialize()
			{
				// Slides, viewer, reel

					__viewer = getElement(settings.viewerSelector, true);
					__reel = getElement(settings.reelSelector, true);
					__slides = getElement(settings.slidesSelector, true);

				// Navigation

					__navFirst = getElement(settings.slidernavFirstSelector);
					__navLast = getElement(settings.slidernavLastSelector);
					__navNext = getElement(settings.slidernavNextSelector);
					__navPrevious = getElement(settings.slidernavPreviousSelector);
					__navStopAdvance = getElement(settings.slidernavStopAdvanceSelector);
					__navPlayAdvance = getElement(settings.slidernavPlayAdvanceSelector);

				// Check configuration status
				
					if (isConfigured == false)
					{
						alert('Error: One or more configuration errors detected. Aborting.');
						return;
					}

				// Set up

					// Viewer
					
						__viewer.css('position', 'relative');
						__viewer.css('overflow', 'hidden');

					// Reel
					
						__reel.css('position', 'absolute');
						__reel.css('left', 0);
						__reel.css('top', 0);

					// Slides
				
						var cx = 0, length = __slides.height;
				
						if (length > 2 && settings.seamlessWrap)
						{
							isSeamless = true;

							var first = __slides.first();
							var last = __slides.last();
							
							last.clone().insertBefore(first);
							first.clone().insertAfter(last);

							__slides = getElement(settings.slidesSelector, true);
						}
						
						__slides.each(function(index) {

							var y = jQuery(this);

							list[index] = {
								object:		y,
								x:			cx,
								realIndex:	false
							};
							
							y.css('position', 'absolute');
							y.css('left', 0);
							y.css('top', cx);
							
							cx += y.height();
						});

						if (isSeamless)
						{
							list[0].realIndex = length; // second to last
							list[length + 1].realIndex = 1; // second
						}
						
					// Navigation

						if (__navFirst)
							__navFirst.click(function(event) {
								event.preventDefault();

								if (isLocked)
									return false;

								if (isAdvancing)
									interruptAdvance();
								
								firstSlide();
							});

						if (__navLast)
							__navLast.click(function(event) {
								event.preventDefault();

								if (isLocked)
									return false;

								if (isAdvancing)
									interruptAdvance();

								lastSlide();
							});

						if (__navNext)
							__navNext.click(function(event) {
								event.preventDefault();

								if (isLocked)
									return false;

								if (isAdvancing)
									interruptAdvance();

								nextSlide();
							});

						if (__navPrevious)
							__navPrevious.click(function(event) {
								event.preventDefault();

								if (isLocked)
									return false;
							
								if (isAdvancing)
									interruptAdvance();

								previousSlide();
							});

						if (__navStopAdvance)
							__navStopAdvance.click(function(event) {
								event.preventDefault();

								if (isLocked)
									return false;

								if (!isAdvancing)
									return false;

								__navStopAdvance.addClass(settings.advanceNavActiveClass);
								
								if (__navPlayAdvance)
									__navPlayAdvance.removeClass(settings.advanceNavActiveClass);

								stopAdvance();
							});

						if (__navPlayAdvance)
							__navPlayAdvance.click(function(event) {
								event.preventDefault();

								if (isLocked)
									return false;
									
								if (isAdvancing)
									return false;

								__navPlayAdvance.addClass(settings.advanceNavActiveClass);
								
								if (__navStopAdvance)
									__navStopAdvance.removeClass(settings.advanceNavActiveClass);

								playAdvance();
							});

			}

			// Ready

				jQuery().ready(function() {
					initialize();
					initializeAdvance();
					firstSlide();
				});
	};

})(jQuery);