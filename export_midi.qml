/*
==============================================
  Exports MIDI v2.0

  Copyright (C)2022 Tormy Van Cool

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
==============================================
*/

import QtQuick 2.2
import QtQuick.Dialogs 1.1
import FileIO 3.0
import MuseScore 3.0

MuseScore {
	id: exportMidiForReaper
    version:  "2.0"
    description: qsTr("Export MIDI for REAPER")
	
    width: 600
    height: 124	

    Component.onCompleted: {
        if (mscoreMajorVersion >= 4) {
            exportMidiForReaper.title = "MIDI Exporter";
            exportMidiForReaper.thumbnailName = "export_midi.png";
            exportMidiForReaper.categoryCode = "composing-arranging-tools";
        } else {
			errorDialog.text = qsTr("MuseScore Version not compatible");
			errorDialog.open();
		}
    }
	
    MessageDialog {
        id: doneDialog
        title:  qsTr("DONE")
        text: ""
        onAccepted: {
            quit()
        }
        visible: false
    }
	
    MessageDialog {
        id: errorDialog
        title:  ""
        text: ""
        onAccepted: {
            quit()
        }
        visible: false
    }

    onRun: {
        console.log("hello MIDI Exporter");
		curScore.startCmd();
		var s = curScore;		
		var p = curScore.path;
		//p = p.slice(0, -5);
		//p = p.replace(/\//gi,"\\");
		//writeScore(s, p, 'mid');
		doneDialog.text = qsTr("MIDI file saved");
        doneDialog.open();
		curScore.endCmd()
		quit()
    }
}
