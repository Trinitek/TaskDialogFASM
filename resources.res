        ��  ��                  �      �� ��     0          <?xml version="1.0" encoding="utf-8" standalone="yes"?>
<assembly xmlns="urn:schemas-microsoft-com:asm.v1" manifestVersion="1.0">
    <assemblyIdentity version="1.0.0.0" name="Trinitek.TaskDialogDemo"/>
    <trustInfo xmlns="urn:schemas-microsoft-com:asm.v2">
        <security>
            <requestedPrivileges xmlns="urn:schemas-microsoft-com:asm.v3">
                <requestedExecutionLevel level="asInvoker"/>
            </requestedPrivileges>
        </security>
    </trustInfo>
    <compatibility xmlns="urn:schemas-microsoft-com:compatibility.v1"> 
        <application> 
            <!-- Windows Vista -->
            <supportedOS Id="{e2011457-1546-43c5-a5fe-008deee3d3f0}"/> 
            <!-- Windows 7 -->
            <supportedOS Id="{35138b9a-5d96-4fbd-8e2d-a2440225f93a}"/>
            <!-- Windows 8 -->
            <supportedOS Id="{4a2f28e3-53b9-4441-ba9c-d69d4a4a6e38}"/>
            <!-- Windows 8.1 -->
            <supportedOS Id="{1f676c76-80e1-4239-95bb-83d0f6d0da78}"/>
            <!-- Windows 10 -->
            <supportedOS Id="{8e0f7a12-bfb3-4fe8-b9a5-48fd50a15a9a}"/>
        </application> 
    </compatibility>
    <dependency>
        <!-- Enable visual styles (Required to access version of COMCTL32.DLL that has TaskDialog) -->
        <dependentAssembly>
            <assemblyIdentity
                type="win32"
                name="Microsoft.Windows.Common-Controls"
                version="6.0.0.0"
                processorArchitecture="*"
                publicKeyToken="6595b64144ccf1df"
                language="*"
                />
        </dependentAssembly>
    </dependency>
</assembly>        �� ��e     0          ��        � �      � �     T a s k D i a l o g   D e m o    � M S   S h e l l   D l g              PB � 2  �  ��� & S h o w                 Px � 2  �  ��� & C l o s e               P  ,  ������� & W i n d o w   T i t l e :             � �P  �  �  ���               P $ 7  ������� & M a i n   I n s t r u c t i o n :             � �P 0 �  �  ���               P B .  ������� C o n t e n t   & T e x t :             � �P N �  �  ���               P ` N Z �  ��� B u t t o n s                 PZ ` N Z �  ��� I c o n              P l  
 �  ��� O & K                P x  
 �  ��� & Y e s              P �  
 �  ��� & N o                P � % 
 �  ��� C & a n c e l                P � " 
 �  ��� & R e t r y              P � ! 
 �  ��� C & l o s e             	 P` l ! 
 �  ��� N & o n e               	  P` x   
 �  ��� & E r r o r             	  P` � 5 
 �  ��� & I n f o r m a t i o n             	  P` � # 
 �  ��� S h i e l & d               	  P` � + 
 �  ��� W a r n i n & g        @   A F X _ D I A L O G _ L A Y O U T   ��e     0              