import Toybox.Application;
import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;
import Toybox.Time.Gregorian;
import Toybox.Weather;

class PersonaDigitalView extends WatchUi.WatchFace {
	
	var personaFont;
	var personaFontLarger;
	
	var datePosX = 40;
	var datePosY = 40;
	
    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
        
        personaFont = WatchUi.loadResource(Rez.Fonts.PersonaFont);
        personaFontLarger = WatchUi.loadResource(Rez.Fonts.PersonaFontLarger);
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {

    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Update the date
        var today = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        
        // Set background based on time
        var backgroundResource = Rez.Drawables.BackgroundDay;
        if(today.hour < 6 || today.hour >= 19) {
        	backgroundResource = Rez.Drawables.BackgroundNight;
        }
        var background = WatchUi.loadResource(backgroundResource);

		// Set the month
		var monthBottomResource = Rez.Drawables.MonthBottom1;
		var monthMiddleResource = Rez.Drawables.MonthMiddle1;
		var monthTopResource = Rez.Drawables.MonthTop1;
		var todayMonth = today.month;
//		var todayMonth = 12;
		switch (todayMonth) {
			case 1: {
				monthBottomResource = Rez.Drawables.MonthBottom1;
				monthMiddleResource = Rez.Drawables.MonthMiddle1;
				monthTopResource = Rez.Drawables.MonthTop1;
				break;
			}
			case 2: {
				monthBottomResource = Rez.Drawables.MonthBottom2;
				monthMiddleResource = Rez.Drawables.MonthMiddle2;
				monthTopResource = Rez.Drawables.MonthTop2;
				break;
			}
			case 3: {
				monthBottomResource = Rez.Drawables.MonthBottom3;
				monthMiddleResource = Rez.Drawables.MonthMiddle3;
				monthTopResource = Rez.Drawables.MonthTop3;
				break;
			}
			case 4: {
				monthBottomResource = Rez.Drawables.MonthBottom4;
				monthMiddleResource = Rez.Drawables.MonthMiddle4;
				monthTopResource = Rez.Drawables.MonthTop4;
				break;
			}
			case 5: {
				monthBottomResource = Rez.Drawables.MonthBottom5;
				monthMiddleResource = Rez.Drawables.MonthMiddle5;
				monthTopResource = Rez.Drawables.MonthTop5;
				break;
			}
			case 6: {
				monthBottomResource = Rez.Drawables.MonthBottom6;
				monthMiddleResource = Rez.Drawables.MonthMiddle6;
				monthTopResource = Rez.Drawables.MonthTop6;
				break;
			}
			case 7: {
				monthBottomResource = Rez.Drawables.MonthBottom7;
				monthMiddleResource = Rez.Drawables.MonthMiddle7;
				monthTopResource = Rez.Drawables.MonthTop7;
				break;
			}
			case 8: {
				monthBottomResource = Rez.Drawables.MonthBottom8;
				monthMiddleResource = Rez.Drawables.MonthMiddle8;
				monthTopResource = Rez.Drawables.MonthTop8;
				break;
			}
			case 9: {
				monthBottomResource = Rez.Drawables.MonthBottom9;
				monthMiddleResource = Rez.Drawables.MonthMiddle9;
				monthTopResource = Rez.Drawables.MonthTop9;
				break;
			}
			case 10: {
				monthBottomResource = Rez.Drawables.MonthBottom10;
				monthMiddleResource = Rez.Drawables.MonthMiddle10;
				monthTopResource = Rez.Drawables.MonthTop10;
				break;
			}
			case 11: {
				monthBottomResource = Rez.Drawables.MonthBottom11;
				monthMiddleResource = Rez.Drawables.MonthMiddle11;
				monthTopResource = Rez.Drawables.MonthTop11;
				break;
			}
			case 12: {
				monthBottomResource = Rez.Drawables.MonthBottom12;
				monthMiddleResource = Rez.Drawables.MonthMiddle12;
				monthTopResource = Rez.Drawables.MonthTop12;
				break;
			}
			default:
			break;
		}
		
    	var monthBottom = WatchUi.loadResource(monthBottomResource);
    	var monthMiddle = WatchUi.loadResource(monthMiddleResource);
    	var monthTop = WatchUi.loadResource(monthTopResource);

		// Set the day
		var dayBottomResource = Rez.Drawables.DayBottom0;
		var dayMiddleResource = Rez.Drawables.DayMiddle0;
		var dayTopResource = Rez.Drawables.DayTop0;
		var todayDay = today.day;
//		var todayDay = 11;
		var weatherPosXOffset = 0;
		switch (todayDay) {
			case 0: {
				dayBottomResource = Rez.Drawables.DayBottom0;
				dayMiddleResource = Rez.Drawables.DayMiddle0;
				dayTopResource = Rez.Drawables.DayTop0;
				weatherPosXOffset = -10;
				break;
			}
			case 1: {
				dayBottomResource = Rez.Drawables.DayBottom1;
				dayMiddleResource = Rez.Drawables.DayMiddle1;
				dayTopResource = Rez.Drawables.DayTop1;
				weatherPosXOffset = -12;
				break;
			}
			case 2: {
				dayBottomResource = Rez.Drawables.DayBottom2;
				dayMiddleResource = Rez.Drawables.DayMiddle2;
				dayTopResource = Rez.Drawables.DayTop2;
				weatherPosXOffset = -10;
				break;
			}
			case 3: {
				dayBottomResource = Rez.Drawables.DayBottom3;
				dayMiddleResource = Rez.Drawables.DayMiddle3;
				dayTopResource = Rez.Drawables.DayTop3;
				weatherPosXOffset = -10;
				break;
			}
			case 4: {
				dayBottomResource = Rez.Drawables.DayBottom4;
				dayMiddleResource = Rez.Drawables.DayMiddle4;
				dayTopResource = Rez.Drawables.DayTop4;
				weatherPosXOffset = -10;
				break;
			}
			case 5: {
				dayBottomResource = Rez.Drawables.DayBottom5;
				dayMiddleResource = Rez.Drawables.DayMiddle5;
				dayTopResource = Rez.Drawables.DayTop5;
				weatherPosXOffset = -10;
				break;
			}
			case 6: {
				dayBottomResource = Rez.Drawables.DayBottom6;
				dayMiddleResource = Rez.Drawables.DayMiddle6;
				dayTopResource = Rez.Drawables.DayTop6;
				weatherPosXOffset = -10;
				break;
			}
			case 7: {
				dayBottomResource = Rez.Drawables.DayBottom7;
				dayMiddleResource = Rez.Drawables.DayMiddle7;
				dayTopResource = Rez.Drawables.DayTop7;
				weatherPosXOffset = -13;
				break;
			}
			case 8: {
				dayBottomResource = Rez.Drawables.DayBottom8;
				dayMiddleResource = Rez.Drawables.DayMiddle8;
				dayTopResource = Rez.Drawables.DayTop8;
				weatherPosXOffset = -10;
				break;
			}
			case 9: {
				dayBottomResource = Rez.Drawables.DayBottom9;
				dayMiddleResource = Rez.Drawables.DayMiddle9;
				dayTopResource = Rez.Drawables.DayTop9;
				weatherPosXOffset = -10;
				break;
			}
			case 10: {
				dayBottomResource = Rez.Drawables.DayBottom10;
				dayMiddleResource = Rez.Drawables.DayMiddle10;
				dayTopResource = Rez.Drawables.DayTop10;
				break;
			}
			case 11: {
				dayBottomResource = Rez.Drawables.DayBottom11;
				dayMiddleResource = Rez.Drawables.DayMiddle11;
				dayTopResource = Rez.Drawables.DayTop11;
				weatherPosXOffset = -2;
				break;
			}
			case 12: {
				dayBottomResource = Rez.Drawables.DayBottom12;
				dayMiddleResource = Rez.Drawables.DayMiddle12;
				dayTopResource = Rez.Drawables.DayTop12;
				break;
			}
			case 13: {
				dayBottomResource = Rez.Drawables.DayBottom13;
				dayMiddleResource = Rez.Drawables.DayMiddle13;
				dayTopResource = Rez.Drawables.DayTop13;
				break;
			}
			case 14: {
				dayBottomResource = Rez.Drawables.DayBottom14;
				dayMiddleResource = Rez.Drawables.DayMiddle14;
				dayTopResource = Rez.Drawables.DayTop14;
				break;
			}
			case 15: {
				dayBottomResource = Rez.Drawables.DayBottom15;
				dayMiddleResource = Rez.Drawables.DayMiddle15;
				dayTopResource = Rez.Drawables.DayTop15;
				break;
			}
			case 16: {
				dayBottomResource = Rez.Drawables.DayBottom16;
				dayMiddleResource = Rez.Drawables.DayMiddle16;
				dayTopResource = Rez.Drawables.DayTop16;
				break;
			}
			case 17: {
				dayBottomResource = Rez.Drawables.DayBottom17;
				dayMiddleResource = Rez.Drawables.DayMiddle17;
				dayTopResource = Rez.Drawables.DayTop17;
				weatherPosXOffset = -5;
				break;
			}
			case 18: {
				dayBottomResource = Rez.Drawables.DayBottom18;
				dayMiddleResource = Rez.Drawables.DayMiddle18;
				dayTopResource = Rez.Drawables.DayTop18;
				break;
			}
			case 19: {
				dayBottomResource = Rez.Drawables.DayBottom19;
				dayMiddleResource = Rez.Drawables.DayMiddle19;
				dayTopResource = Rez.Drawables.DayTop19;
				break;
			}
			case 20: {
				dayBottomResource = Rez.Drawables.DayBottom20;
				dayMiddleResource = Rez.Drawables.DayMiddle20;
				dayTopResource = Rez.Drawables.DayTop20;
				break;
			}
			case 21: {
				dayBottomResource = Rez.Drawables.DayBottom21;
				dayMiddleResource = Rez.Drawables.DayMiddle21;
				dayTopResource = Rez.Drawables.DayTop21;
				weatherPosXOffset = -2;
				break;
			}
			case 22: {
				dayBottomResource = Rez.Drawables.DayBottom22;
				dayMiddleResource = Rez.Drawables.DayMiddle22;
				dayTopResource = Rez.Drawables.DayTop22;
				break;
			}
			case 23: {
				dayBottomResource = Rez.Drawables.DayBottom23;
				dayMiddleResource = Rez.Drawables.DayMiddle23;
				dayTopResource = Rez.Drawables.DayTop23;
				break;
			}
			case 24: {
				dayBottomResource = Rez.Drawables.DayBottom24;
				dayMiddleResource = Rez.Drawables.DayMiddle24;
				dayTopResource = Rez.Drawables.DayTop24;
				break;
			}
			case 25: {
				dayBottomResource = Rez.Drawables.DayBottom25;
				dayMiddleResource = Rez.Drawables.DayMiddle25;
				dayTopResource = Rez.Drawables.DayTop25;
				break;
			}
			case 26: {
				dayBottomResource = Rez.Drawables.DayBottom26;
				dayMiddleResource = Rez.Drawables.DayMiddle26;
				dayTopResource = Rez.Drawables.DayTop26;
				break;
			}
			case 27: {
				dayBottomResource = Rez.Drawables.DayBottom27;
				dayMiddleResource = Rez.Drawables.DayMiddle27;
				dayTopResource = Rez.Drawables.DayTop27;
				weatherPosXOffset = -5;
				break;
			}
			case 28: {
				dayBottomResource = Rez.Drawables.DayBottom28;
				dayMiddleResource = Rez.Drawables.DayMiddle28;
				dayTopResource = Rez.Drawables.DayTop28;
				break;
			}
			case 29: {
				dayBottomResource = Rez.Drawables.DayBottom29;
				dayMiddleResource = Rez.Drawables.DayMiddle29;
				dayTopResource = Rez.Drawables.DayTop29;
				break;
			}
			case 30: {
				dayBottomResource = Rez.Drawables.DayBottom30;
				dayMiddleResource = Rez.Drawables.DayMiddle30;
				dayTopResource = Rez.Drawables.DayTop30;
				break;
			}
			case 31: {
				dayBottomResource = Rez.Drawables.DayBottom31;
				dayMiddleResource = Rez.Drawables.DayMiddle31;
				dayTopResource = Rez.Drawables.DayTop31;
				weatherPosXOffset = -2;
				break;
			}
			default:
			break;
		}
		
    	var dayBottom = WatchUi.loadResource(dayBottomResource);
    	var dayMiddle = WatchUi.loadResource(dayMiddleResource);
    	var dayTop = WatchUi.loadResource(dayTopResource);
    	
    	// Set the day of the week
		var weekdayBottomResource = Rez.Drawables.MondayBottom;
		var weekdayMiddleResource = Rez.Drawables.MondayMiddle;
		var weekdayTopResource = Rez.Drawables.MondayTop;
		var todayWeekday = today.day_of_week;
//		var todayWeekday = 7;
		switch (todayWeekday) {
			case 1: {
				weekdayBottomResource = Rez.Drawables.SundayBottom;
				weekdayMiddleResource = Rez.Drawables.SundayMiddle;
				weekdayTopResource = Rez.Drawables.SundayTop;
				break;
			}
			case 2: {
				weekdayBottomResource = Rez.Drawables.MondayBottom;
				weekdayMiddleResource = Rez.Drawables.MondayMiddle;
				weekdayTopResource = Rez.Drawables.MondayTop;
				break;
			}
			case 3: {
				weekdayBottomResource = Rez.Drawables.TuesdayBottom;
				weekdayMiddleResource = Rez.Drawables.TuesdayMiddle;
				weekdayTopResource = Rez.Drawables.TuesdayTop;
				break;
			}
			case 4: {
				weekdayBottomResource = Rez.Drawables.WednesdayBottom;
				weekdayMiddleResource = Rez.Drawables.WednesdayMiddle;
				weekdayTopResource = Rez.Drawables.WednesdayTop;
				break;
			}
			case 5: {
				weekdayBottomResource = Rez.Drawables.ThursdayBottom;
				weekdayMiddleResource = Rez.Drawables.ThursdayMiddle;
				weekdayTopResource = Rez.Drawables.ThursdayTop;
				break;
			}
			case 6: {
				weekdayBottomResource = Rez.Drawables.FridayBottom;
				weekdayMiddleResource = Rez.Drawables.FridayMiddle;
				weekdayTopResource = Rez.Drawables.FridayTop;
				break;
			}
			case 7: {
				weekdayBottomResource = Rez.Drawables.SaturdayBottom;
				weekdayMiddleResource = Rez.Drawables.SaturdayMiddle;
				weekdayTopResource = Rez.Drawables.SaturdayTop;
				break;
			}
			default:
			break;
		}
		
    	var weekdayBottom = WatchUi.loadResource(weekdayBottomResource);
    	var weekdayMiddle = WatchUi.loadResource(weekdayMiddleResource);
    	var weekdayTop = WatchUi.loadResource(weekdayTopResource);

        // Update the weather
        var weatherResource = Rez.Drawables.WeatherSunny;
        if (Weather.getCurrentConditions() != null) {
            var weatherCondition = Weather.getCurrentConditions().condition;
	        switch (weatherCondition) {
				case 4: // Ice
				case 10:
				case 16:
				case 17:
				case 18:
				case 19:
				case 21:
				case 34:
				case 43:
				case 44:
				case 46:
				case 47:
				case 51:
				weatherResource = Rez.Drawables.WeatherSnowy;
		        break;
		        case 3: // Raining
		        case 7:
		        case 11:
		        case 13:
		        case 14:
		        case 15:
		        case 24:
		        case 25:
		        case 26:
		        case 27:
		        case 31:
				case 45:
				case 6: // Lightning
			    case 12:
			    case 28:
				weatherResource = Rez.Drawables.WeatherRainy;
			    break;
			    case 1: // Cloudy
			    case 2:
			    case 5:
			    case 8:
			    case 9:
			    case 20:
			    case 29:
			    case 33:
			    case 39:
			    case 52:
			    weatherResource = Rez.Drawables.WeatherCloudy;
			    break;
			    case 0: // Sunny
			    case 22:
			    case 23:
			    case 40:
			    weatherResource = Rez.Drawables.WeatherSunny;
			    break;
			    default: // Unknown
			    break;
			}
		}
		var weather = WatchUi.loadResource(weatherResource);
		
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        
        dc.drawBitmap(0, 0, background);
        
        dc.drawBitmap(datePosX - 5, datePosY, monthBottom);
		dc.drawBitmap(datePosX, datePosY, dayBottom);
        dc.drawBitmap(datePosX, datePosY + 8, weekdayBottom);
        
		dc.drawBitmap(datePosX + weatherPosXOffset, datePosY + 8, weather);
        
        dc.drawBitmap(datePosX - 5, datePosY, monthMiddle);
        dc.drawBitmap(datePosX, datePosY, dayMiddle);
        
        dc.drawBitmap(datePosX - 5, datePosY, monthTop);
        dc.drawBitmap(datePosX, datePosY, dayTop);

        dc.drawBitmap(datePosX, datePosY + 8, weekdayMiddle);
        dc.drawBitmap(datePosX, datePosY + 8, weekdayTop);
        
        // Get the current time and format it correctly
        var timeFormat = "$1$:$2$";
        var clockTime = System.getClockTime();
        var hours = clockTime.hour;
        if (!System.getDeviceSettings().is24Hour) {
            if (hours > 12) {
                hours = hours - 12;
            }
        } else {
            if (getApp().getProperty("UseMilitaryFormat")) {
                timeFormat = "$1$$2$";
                hours = hours.format("%02d");
            }
        }
        var timeString = Lang.format(timeFormat, [hours, clockTime.min.format("%02d")]);

        // Update the timelabel
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.drawText(120, 120, personaFontLarger, timeString, Graphics.TEXT_JUSTIFY_CENTER );
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.drawText(120, 120, personaFont, timeString, Graphics.TEXT_JUSTIFY_CENTER );
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
