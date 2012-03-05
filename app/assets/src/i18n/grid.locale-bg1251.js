;(function($){
/**
 * jqGrid Bulgarian Translation 
 * Tony Tomov tony@trirand.com
 * http://trirand.com/blog/ 
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
**/
$.jgrid = {
	defaults : {
		recordtext: "{0} - {1} îò {2}",
		emptyrecords: "Íÿìà çàïèñ(è)",
		loadtext: "Çàðåæäàì...",
		pgtext : "Ñòð. {0} îò {1}"
	},
	search : {
		caption: "Òúðñåíå...",
		Find: "Íàìåðè",
		Reset: "Èç÷èñòè",
		odata : ['ðàâíî', 'ðàçëè÷íî', 'ïî-ìàëêî', 'ïî-ìàëêî èëè=','ïî-ãîëÿìî','ïî-ãîëÿìî èëè =', 'çàïî÷âà ñ','íå çàïî÷âà ñ','ñå íàìèðà â','íå ñå íàìèðà â','çàâúðøâà ñ','íå çàâúðøàâà ñ','ñúäúðæà', 'íå ñúäúðæà' ],
	    groupOps: [	{ op: "AND", text: " È " },	{ op: "OR",  text: "ÈËÈ" }	],
		matchText: " âêëþ÷è",
		rulesText: " êëàóçà"
	},
	edit : {
		addCaption: "Íîâ Çàïèñ",
		editCaption: "Ðåäàêöèÿ Çàïèñ",
		bSubmit: "Çàïèøè",
		bCancel: "Èçõîä",
		bClose: "Çàòâîðè",
		saveData: "Äàííèòå ñà ïðîìåíåíè! Äà ñúõðàíÿ ëè ïðîìåíèòå?",
		bYes : "Äà",
		bNo : "Íå",
		bExit : "Îòêàç",
		msg: {
		    required:"Ïîëåòî å çàäúëæèòåëíî",
		    number:"Âúâåäåòå âàëèäíî ÷èñëî!",
		    minValue:"ñòîéíîñòòà òðÿáâà äà å ïî-ãîëÿìà èëè ðàâíà îò",
		    maxValue:"ñòîéíîñòòà òðÿáâà äà å ïî-ìàëêà èëè ðàâíà îò",
		    email: "íå å âàëèäåí åë. àäðåñ",
		    integer: "Âúâåäåòå âàëèäíî öÿëî ÷èñëî",
			date: "Âúâåäåòå âàëèäíà äàòà",
			url: "e íåâàëèäåí URL. Èçèñêàâà ñå ïðåôèêñ('http://' èëè 'https://')",
			nodefined : " å íåäåôèíèðàíà!",
			novalue : " èçèñêâà âðúùàíå íà ñòîéíîñò!",
			customarray : "Ïîòðåá. Ôóíêöèÿ òðÿáâà äà âúðíå ìàñèâ!",
			customfcheck : "Ïîòðåáèòåëñêà ôóíêöèÿ å çàäúëæèòåëíà ïðè òîçè òèï åëåìåíò!"
		}
	},
	view : {
	    caption: "Ïðåãëåä çàïèñ",
	    bClose: "Çàòâîðè"
	},
	del : {
		caption: "Èçòðèâàíå",
		msg: "Äà èçòðèÿ ëè èçáðàíèÿò çàïèñ?",
		bSubmit: "Èçòðèé",
		bCancel: "Îòêàç"
	},
	nav : {
		edittext: " ",
		edittitle: "Ðåäàêöèÿ èçáðàí çàïèñ",
		addtext:" ",
		addtitle: "Äîáàâÿíå íîâ çàïèñ",
		deltext: " ",
		deltitle: "Èçòðèâàíå èçáðàí çàïèñ",
		searchtext: " ",
		searchtitle: "Òúðñåíå çàïèñ(è)",
		refreshtext: "",
		refreshtitle: "Îáíîâè òàáëèöà",
		alertcap: "Ïðåäóïðåæäåíèå",
		alerttext: "Ìîëÿ, èçáåðåòå çàïèñ",
		viewtext: "",
		viewtitle: "Ïðåãëåä èçáðàí çàïèñ"
	},
	col : {
		caption: "Èçáîð êîëîíè",
		bSubmit: "Îê",
		bCancel: "Èçõîä"	
	},
	errors : {
		errcap : "Ãðåøêà",
		nourl : "Íÿìà ïîñî÷åí url àäðåñ",
		norecords: "Íÿìà çàïèñ çà îáðàáîòêà",
		model : "Ìîäåëà íå ñúîòâåòñòâà íà èìåíàòà!"	
	},
	formatter : {
		integer : {thousandsSeparator: " ", defaultValue: '0'},
		number : {decimalSeparator:".", thousandsSeparator: " ", decimalPlaces: 2, defaultValue: '0.00'},
		currency : {decimalSeparator:".", thousandsSeparator: " ", decimalPlaces: 2, prefix: "", suffix:" ëâ.", defaultValue: '0.00'},
		date : {
			dayNames:   [
				"Íåä", "Ïîí", "Âò", "Ñð", "×åò", "Ïåò", "Ñúá",
				"Íåäåëÿ", "Ïîíåäåëíèê", "Âòîðíèê", "Ñðÿäà", "×åòâúðòúê", "Ïåòúê", "Ñúáîòà"
			],
			monthNames: [
				"ßíó", "Ôåâ", "Ìàð", "Àïð", "Ìàé", "Þíè", "Þëè", "Àâã", "Ñåï", "Îêò", "Íîâ", "Äåê",
				"ßíóàðè", "Ôåâðóàðè", "Ìàðò", "Àïðèë", "Ìàé", "Þíè", "Þëè", "Àâãóñò", "Ñåïòåìâðè", "Îêòîìâðè", "Íîåìâðè", "Äåêåìâðè"
			],
			AmPm : ["","","",""],
			S: function (j) {
				if(j==7 || j==8 || j== 27 || j== 28) {
					return 'ìè';
				}
				return ['âè', 'ðè', 'òè'][Math.min((j - 1) % 10, 2)];
			},
			srcformat: 'Y-m-d',
			newformat: 'd/m/Y',
			masks : {
		        ISO8601Long:"Y-m-d H:i:s",
		        ISO8601Short:"Y-m-d",
		        ShortDate: "n/j/Y",
		        LongDate: "l, F d, Y",
		        FullDateTime: "l, F d, Y g:i:s A",
		        MonthDay: "F d",
		        ShortTime: "g:i A",
		        LongTime: "g:i:s A",
		        SortableDateTime: "Y-m-d\\TH:i:s",
		        UniversalSortableDateTime: "Y-m-d H:i:sO",
		        YearMonth: "F, Y"
		    },
		    reformatAfterEdit : false
		},
		baseLinkUrl: '',
		showAction: '',
		target: '',
		checkbox : {disabled:true},
		idName : 'id'
	}
};
})(jQuery);
