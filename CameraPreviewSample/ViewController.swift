import Cocoa
import AVFoundation

class ViewController: NSViewController {

    @IBOutlet weak var preview: NSView!
    @IBAction func buttonClicked(_ sender: Any) {

    }

    override func viewDidLoad() {
        super.viewDidLoad();

        do {
            let session = AVCaptureSession()
            session.beginConfiguration()
            session.sessionPreset = AVCaptureSessionPresetPhoto
            let device:AVCaptureDevice = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo)
            let videoDeviceInput = try AVCaptureDeviceInput(device: device)
            session.addInput(videoDeviceInput)
            let previewLayer = AVCaptureVideoPreviewLayer(session: session)!
            previewLayer.frame = preview.bounds

            previewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
            preview.layer?.addSublayer(previewLayer)
            session.commitConfiguration()
            session.startRunning()
        } catch {
            print("Could not create video device input: \(error)")
        }
    }
}

