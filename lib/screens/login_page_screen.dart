import 'splash_screen.dart';
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{
  var userName= TextEditingController();
  var password = TextEditingController();
  String? emailError;
  bool isHidden = true;
  @override
  Widget build(BuildContext context){    
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Login Page Screen")),
        // backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 30,),
            ),
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                controller : userName,
                decoration: InputDecoration(
                  hintText: 'Enter UserName',
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.login)),
                  errorText: emailError,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: Colors.green.shade400,
                      width: 5,
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: Colors.orange.shade400,
                      width: 3,
                    )
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color:Colors.red.shade900,
                      width: 7,
                    )
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color:Colors.red.shade900,
                      width: 7,
                    )
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: TextField(
                keyboardType: TextInputType.phone,
                controller : password,
                obscureText: isHidden,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  errorText: emailError,
                  hintText: 'Enter Password : ',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        isHidden = !isHidden;
                      });
                    }, 
                    icon: Icon(Icons.remove_red_eye)
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: Colors.green.shade400,
                      width: 5,
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color: Colors.orange.shade400,
                      width: 3,
                    )
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color:Colors.red.shade900,
                      width: 7,
                    )
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(11),
                    borderSide: BorderSide(
                      color:Colors.red.shade900,
                      width: 7,
                    )
                  ),
                ),
              ),
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.orange),
              ),
              onPressed: () async {
                String userN = userName.text.trim();
                String userPwd = password.text;
                
                if (userN == 'admin@gmail.com' && userPwd == 'pwd') {
                  var sharedpref = await SharedPreferences.getInstance();
                  sharedpref.setBool(SplashScreenState.islogin, true);
                  
                  setState(() {
                    emailError = null;
                  });
                  // if(!mounted) return;
                  if(!context.mounted) return;
                  Navigator.pushReplacement( context, MaterialPageRoute(builder: (_) => const HomeScreen()));                 
                } else {
                  setState(() {
                    emailError = "Invalid credentials";
                  });
                }
              },
              icon: Icon(
                Icons.login, // Add the icon here
                color: Colors.red,
                size: 24,
              ),
              label: Text('Login',
                style: TextStyle(
                  fontSize:   20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              )
            )
          ],
        ),
      )

    );
  }
}