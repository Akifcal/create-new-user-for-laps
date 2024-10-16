# create-new-user-for-laps
create a new user for laps with temporary random password

I have created the code to create LAPS account. With this you can create your own local account, which can be used for the LAPS.


Unfortunately, you cannot create an account using the Windows on-board tools via GPO.
This means you can implement the code using a startup script in the GPO for computer settings. The account is checked every time the computer starts and if it does not exist, it is created.

Screenshot:

<img width="593" alt="image" src="https://github.com/user-attachments/assets/e4a97061-d587-4898-9225-00adcaf16db9">

