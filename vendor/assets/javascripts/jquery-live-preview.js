/***********************************************
Jquery Live Link Preview Plugin
Copyright (c) 2014 Alan Phoon, www.ampedupdesigns.com  
This notice MUST stay intact for legal use and may not be modified.

Licensed under GNU GENERAL PUBLIC LICENSE
***********************************************/
(function($) {
  $.fn.extend({
     livePreview: function(options) {
         
         var defaults = {
             trigger: 'hover',
             targetWidth : 1000,
             targetHeight: 800,
             viewWidth: 300,
             viewHeight: 200,
         };

         var options = $.extend(defaults, options);
         //calculate appropriate scaling based on width.
         var scale_w = (options.viewWidth / options.targetWidth);
         var scale_h = (options.viewHeight / options.targetHeight);
         var scale_f = 1;
         var preview_id = 'livepreview_dialog';

         if(typeof options.scale != 'undefined')
             scale_f = options.scale;
         else
         {
             if(scale_w > scale_h)
                 scale_f = scale_w;
             else
                 scale_f = scale_h;
         }
         
         var showPreview = function(event) {
             var triggerType = event.data.triggerType;
             var obj = event.data.target;
             var href = event.data.href;
             var s = event.data.scale;
             
             if( (triggerType == 'click') && ($('#' + preview_id).length == 0) ) {
                 event.preventDefault();
             }



             if(obj.attr("data-scale"))
                 s = obj.attr("data-scale");


             //hover on
             $("#holder").hide();
             $('.thumbnail').prepend('<iframe id="livepreview_dialog" src="' + href + '" style="height:' + options.targetHeight + 'px; width:' + options.targetWidth + 'px;-moz-transform: scale('+ s + ');-moz-transform-origin: 0 0;-o-transform: scale('+ s + ');-o-transform-origin: 0 0;-webkit-transform: scale('+ s + ');-webkit-transform-origin: 0 0;"></iframe>');
             $('#' + preview_id).fadeIn(100);
         };

         return this.each(function() {
            var o = options;
            var s = scale_f;
            var obj = $(this);
            var href = obj.attr("data-preview-url") || obj.attr("href");
            var triggerType = options.trigger;

            if(obj.attr("data-trigger")) {
                triggerType = obj.attr("data-trigger");
            }

            if(triggerType != 'click') {
                triggerType = 'mouseenter';
                obj.on('click', function() {
                    $('#' + preview_id).remove();
                });
            }
            
            obj.on(triggerType, null, { triggerType: triggerType, target: obj, href: href, scale: s }, showPreview);
            obj.on('mouseleave', function() {
                $('#' + preview_id).remove();
              $("#holder").show();
            });

         });
     }
  });
})(jQuery);
