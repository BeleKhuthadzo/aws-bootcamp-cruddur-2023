-- this file was manually created
INSERT INTO public.users (display_name, handle, email, cognito_user_id)
VALUES
  ('Andrew Brown', 'andrewbrown', 'kbele15@gmail.com','MOCK'),
  ('Khuthadzo Bele', 'khuthadzobele', 'kbele15@gmail.com','MOCK');
  ('Jimmy Jambo', 'jj', 'jj@gmail.com','MOCK');

INSERT INTO public.activities (user_uuid, message, expires_at)
VALUES
  (
    (SELECT uuid from public.users WHERE users.handle = 'andrewbrown' LIMIT 1),
    'This was imported as seed data!',
    current_timestamp + interval '10 day'
  )