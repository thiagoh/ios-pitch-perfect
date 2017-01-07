//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Thiago Andrade on 2017-01-04.
//  Copyright © 2017 Thiago Andrade. All rights reserved.
//

import UIKit
import AVFoundation

public protocol AudioRecorderDescriptor {

  func getFileUrl() -> URL;
}

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate, AudioRecorderDescriptor {

  var recording: Bool!;
  var audioRecorder: AVAudioRecorder!;

  @IBOutlet weak var recordingLabel: UILabel!;
  @IBOutlet weak var recordingButton: UIButton!;
  @IBOutlet weak var stopRecordingButton: UIButton!;

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder);

    print("this is the first method", aDecoder);
    recording = false;
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated);

    print("view will appear");
    recordingButton.isEnabled = !recording;
    stopRecordingButton.isEnabled = recording;
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func recordAudio(_ sender: Any) {
    print("print record button was pressed");

    if (recording == true) {
      return;
    }

    recording = true;

    recordingLabel.text = "Recording in Progress...";
    recordingButton.isEnabled = false;
    stopRecordingButton.isEnabled = true;

    let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String

    let recordingName = "recordedVoice.wav"
    let pathArray = [dirPath, recordingName]
    let filePath = URL(string: pathArray.joined(separator: "/"))

    print("file path is", filePath!.path as String);

    let session = AVAudioSession.sharedInstance()
    try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with: AVAudioSessionCategoryOptions.defaultToSpeaker)

    try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])

    audioRecorder.delegate = self;
    audioRecorder.isMeteringEnabled = true;
    audioRecorder.prepareToRecord();
    audioRecorder.record();
  }

  @IBAction func stopRecording(_ sender: Any) {
    print("stop recording!");

    if (recording == false) {
      return;
    }

    recording = false;
    recordingLabel.text = "Saving file...";

    audioRecorder.stop();
    let session = AVAudioSession.sharedInstance();
    try! session.setActive(false);

    recordingLabel.text = "Record finished";
    recordingButton.isEnabled = true;
    stopRecordingButton.isEnabled = false;
  }

  func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
    print("audioRecorderDidFinishRecording");

    if (!flag) {
      print("saving file was not successfull");
      return;
    }

    performSegue(withIdentifier: "stopRecordingSegue", sender: self);
  }

  public func getFileUrl() -> URL {
    return audioRecorder.url;
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if (segue.identifier == "stopRecordingSegue") {

      let nextViewController = segue.destination as! PlaySoundsViewController;
      nextViewController.setAudioDescriptor(sender as! AudioRecorderDescriptor);
      nextViewController.play();
    }
  }

}

