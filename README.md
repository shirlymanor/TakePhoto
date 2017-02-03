# TakePhoto
Take photo/ choose from library and save photo with swift 3 

To create a take a photo view controller:
First add:
1. Imageview
2. Take photo button
3. Choose from library button
4. Save button (will save the photo in your library)

Create outlate to the imageview and action outlate to the buttons

Add two protocols to your view controller class.
If the class used to look like that:
class TakePictureViewController: UIViewController {
Now after adding the protocols:
class TakePictureViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

Add the code to take a photo:

@IBAction func takePhoto(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera)
        {
            print("camera is on")
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
        else
        {
            print("no camera")
        }

    }

# If you are running the app with the simulator you will get the no camera.
Try to run.
You will get an error- read it
It said to add a permission key to the info.plist
Add NSCameraUsageDescription the type is string and write your own message to ask for permission from your user.

Add the code to choose from the library:

Same thing, you will get an error:
Add NSPhotoLibraryUsageDescription to the info.plist choose type string and add your message to ask permission to access your photos library.

Now add imagePickerController - This function happend when it's finished picking the photo
 func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage 
        imageView.contentMode = .scaleAspectFit 
        imageView.image = chosenImage 
        dismiss(animated:true, completion: nil) 
    }


