package controller;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class ProcessCung extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Lấy dữ liệu từ form
        String name = request.getParameter("name");
        String country = request.getParameter("born");
        int day = Integer.parseInt(request.getParameter("dd"));
        int month = Integer.parseInt(request.getParameter("mm"));
        int year = Integer.parseInt(request.getParameter("yyyy"));
        int hour = Integer.parseInt(request.getParameter("hh"));
        int minute = Integer.parseInt(request.getParameter("mm"));
        String amPm = request.getParameter("ampm");

        // Chuyển đổi giờ AM/PM thành 24h
        if ("PM".equals(amPm) && hour != 12) {
            hour += 12;
        } else if ("AM".equals(amPm) && hour == 12) {
            hour = 0;
        }

        // Chuyển thành Julian Date
        double jd = convertToJulianDate(year, month, day, hour, minute);

        // Tính toán vị trí các hành tinh (giả lập công thức đơn giản)
        double sunLongitude = (jd * 0.9856) % 360;
        double moonLongitude = (jd * 13.1764) % 360;
        double mercuryLongitude = (jd * 4.092) % 360;
        double venusLongitude = (jd * 1.602) % 360;
        double marsLongitude = (jd * 0.524) % 360;
        double jupiterLongitude = (jd * 0.0843) % 360;
        double saturnLongitude = (jd * 0.0339) % 360;
        double uranusLongitude = (jd * 0.0119) % 360;
        double neptuneLongitude = (jd * 0.0061) % 360;
        double plutoLongitude = (jd * 0.004) % 360;

        // Tính toán vị trí North Node, Chiron, Ascendant, MC
        double northNodeLongitude = (jd * 0.053) % 360;
        double chironLongitude = (jd * 0.024) % 360;
        double ascendantLongitude = (hour * 15) % 360;
        double mcLongitude = (minute * 6) % 360;
        String ZodiacSign = getZodiacSign02(day, month);
        String MessageForSign = getMessageForSign(ZodiacSign);
        String HealthMessageForSign = getHealthMessageForSign(ZodiacSign);
        String LoveMessageForSign = getLoveMessageForSign(ZodiacSign);
        String StudyMessageForSign = getStudyMessageForSign(ZodiacSign);
        
        // Xác định cung hoàng đạo
        String sunSign = getZodiacSign(sunLongitude);
        String moonSign = getZodiacSign(moonLongitude);
        String mercurySign = getZodiacSign(mercuryLongitude);
        String venusSign = getZodiacSign(venusLongitude);
        String marsSign = getZodiacSign(marsLongitude);
        String jupiterSign = getZodiacSign(jupiterLongitude);
        String saturnSign = getZodiacSign(saturnLongitude);
        String uranusSign = getZodiacSign(uranusLongitude);
        String neptuneSign = getZodiacSign(neptuneLongitude);
        String plutoSign = getZodiacSign(plutoLongitude);
        String northNodeSign = getZodiacSign(northNodeLongitude);
        String chironSign = getZodiacSign(chironLongitude);
        String ascendantSign = getZodiacSign(ascendantLongitude);
        String mcSign = getZodiacSign(mcLongitude);

        // Xác định cung hoàng đạo
        request.setAttribute("name", name);
        request.setAttribute("country", country);
        request.setAttribute("day", day);
        request.setAttribute("month", month);
        request.setAttribute("year", year);
        request.setAttribute("sunSign", sunSign);
        request.setAttribute("moonSign", moonSign);
        request.setAttribute("mercurySign", mercurySign);
        request.setAttribute("venusSign", venusSign);
        request.setAttribute("marsSign", marsSign);
        request.setAttribute("jupiterSign", jupiterSign);
        request.setAttribute("saturnSign", saturnSign);
        request.setAttribute("uranusSign", uranusSign);
        request.setAttribute("neptuneSign", neptuneSign);
        request.setAttribute("plutoSign", plutoSign);
        request.setAttribute("northNodeSign", northNodeSign);
        request.setAttribute("chironSign", chironSign);
        request.setAttribute("ascendantSign", ascendantSign);
        request.setAttribute("mcSign", mcSign);
        request.setAttribute("MessageForSign", MessageForSign);
        request.setAttribute("HealthMessageForSign", HealthMessageForSign);
        request.setAttribute("LoveMessageForSign", LoveMessageForSign);
        request.setAttribute("StudyMessageForSign", StudyMessageForSign);
        request.setAttribute("ZodiacSign", ZodiacSign);

        // Chuyển hướng sang trang JSP để hiển thị kết quả
        RequestDispatcher dispatcher = request.getRequestDispatcher("cung.jsp");
        dispatcher.forward(request, response);

    }

    private double convertToJulianDate(int year, int month, int day, int hour, int minute) {
        if (month <= 2) {
            year -= 1;
            month += 12;
        }
        int A = year / 100;
        int B = 2 - A + (A / 4);
        return (int) (365.25 * (year + 4716)) + (int) (30.6001 * (month + 1)) + day + B - 1524.5 + (hour + minute / 60.0) / 24.0;
    }

    private String getZodiacSign(double longitude) {
        String[] signs = {"Aries", "Taurus", "Gemini", "Cancer", "Leo", "Virgo",
            "Libra", "Scorpio", "Sagittarius", "Capricorn", "Aquarius", "Pisces"};

        int index = (int) (longitude / 30);
        String sign = signs[index % 12];

        int degrees = (int) (longitude % 30);
        int minutes = (int) ((longitude % 1) * 60);

        return + degrees + "°" + minutes + "'"  + " " + sign ;
    }

    private String getZodiacSign02(int day, int month) {
        String sign = "";
        if ((month == 1 && day >= 20) || (month == 2 && day <= 18)) {
            sign = "Aquarius";
        } else if ((month == 2 && day >= 19) || (month == 3 && day <= 20)) {
            sign = "Pisces";
        } else if ((month == 3 && day >= 21) || (month == 4 && day <= 19)) {
            sign = "Aries";
        } else if ((month == 4 && day >= 20) || (month == 5 && day <= 20)) {
            sign = "Taurus";
        } else if ((month == 5 && day >= 21) || (month == 6 && day <= 20)) {
            sign = "Gemini";
        } else if ((month == 6 && day >= 21) || (month == 7 && day <= 22)) {
            sign = "Cancer";
        } else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
            sign = "Leo";
        } else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
            sign = "Virgo";
        } else if ((month == 9 && day >= 23) || (month == 10 && day <= 22)) {
            sign = "Libra";
        } else if ((month == 10 && day >= 23) || (month == 11 && day <= 21)) {
            sign = "Scorpio";
        } else if ((month == 11 && day >= 22) || (month == 12 && day <= 21)) {
            sign = "Sagittarius";
        } else {
            sign = "Capricorn";
        }
        return sign;
    }

    private String getMessageForSign(String zodiacSign) {
        Map<String, String[]> zodiacMessages = new HashMap<>();

        zodiacMessages.put("Aries", new String[]{
            "Your energy is contagious today, use it wisely!",
            "A bold step will lead you to success.",
            "Embrace challenges, they will shape you into a leader.",
            "Your passion will inspire those around you.",
            "Don’t rush; patience will bring better results."
        });

        zodiacMessages.put("Taurus", new String[]{
            "Stay grounded, and prosperity will follow.",
            "A financial opportunity may arise today.",
            "Take time to enjoy simple pleasures.",
            "Your determination will lead to success.",
            "Trust in your abilities, you are stronger than you think."
        });

        zodiacMessages.put("Gemini", new String[]{
            "Your words have power today, use them wisely.",
            "An interesting conversation will spark new ideas.",
            "Curiosity will lead you to an exciting discovery.",
            "Be flexible; adaptability is your strength.",
            "Take a break from overthinking and trust the process."
        });

        zodiacMessages.put("Cancer", new String[]{
            "Embrace your emotions; they are your strength.",
            "A heartfelt connection will brighten your day.",
            "Trust your intuition, it won’t lead you astray.",
            "Your kindness will come back to you tenfold.",
            "Focus on self-care today, you deserve it."
        });

        zodiacMessages.put("Leo", new String[]{
            "Your confidence will open new doors today.",
            "Let your inner light shine, others are watching.",
            "A leadership opportunity is coming your way.",
            "Your creativity will bring admiration from others.",
            "Stay true to yourself, and success will follow."
        });

        zodiacMessages.put("Virgo", new String[]{
            "Your attention to detail will pay off today.",
            "A small act of kindness will go a long way.",
            "Organization is your superpower, use it wisely.",
            "Take a step back and appreciate your progress.",
            "Helping someone in need will bring you unexpected joy."
        });

        zodiacMessages.put("Libra", new String[]{
            "Seek balance in all things today.",
            "A harmonious interaction will bring joy to your heart.",
            "Your charm will attract positive attention.",
            "A fair decision will benefit everyone involved.",
            "Don’t be afraid to stand up for what you believe in."
        });

        zodiacMessages.put("Scorpio", new String[]{
            "Your intensity is your power, use it wisely.",
            "A mystery will soon reveal itself.",
            "Trust your instincts; they are sharper than ever.",
            "Transformation is on the horizon, embrace it.",
            "A deep conversation will bring clarity to your emotions."
        });

        zodiacMessages.put("Sagittarius", new String[]{
            "Adventure is calling; take the leap!",
            "A new learning opportunity will excite you today.",
            "Your optimism will inspire those around you.",
            "A spontaneous decision will lead to great memories.",
            "Keep your mind open to unexpected possibilities."
        });

        zodiacMessages.put("Capricorn", new String[]{
            "Hard work will pay off sooner than you think.",
            "Your discipline will lead to great rewards.",
            "Stay patient, success is just around the corner.",
            "A wise decision will bring long-term benefits.",
            "You are stronger than you realize, keep pushing forward."
        });

        zodiacMessages.put("Aquarius", new String[]{
            "Innovation will be your key to success today.",
            "A unique idea will impress the right people.",
            "Your vision for the future is becoming clearer.",
            "An unexpected conversation will spark inspiration.",
            "Be yourself, the world needs your originality."
        });

        zodiacMessages.put("Pisces", new String[]{
            "Your intuition is heightened today, trust it.",
            "A creative spark will lead to something wonderful.",
            "Take time for self-reflection, clarity is near.",
            "A compassionate act will bring unexpected joy.",
            "Your dreams are guiding you toward your true path."
        });

        Random random = new Random();
        String[] messages = zodiacMessages.getOrDefault(zodiacSign, new String[]{"Trust yourself, today is full of possibilities!"});

        return "Today: " + messages[random.nextInt(messages.length)];
    }

    private String getHealthMessageForSign(String zodiacSign) {
        Map<String, String[]> healthMessages = new HashMap<>();

        healthMessages.put("Aries", new String[]{
            "Don’t forget to take breaks and avoid burnout.",
            "Regular exercise will keep your energy high.",
            "Drink enough water to stay active.",
            "Avoid impulsive eating; choose healthier options.",
            "Stretching in the morning will help you feel refreshed."
        });

        healthMessages.put("Taurus", new String[]{
            "A balanced diet will help you maintain stability.",
            "Taking nature walks will improve your mental clarity.",
            "Focus on relaxation to reduce tension.",
            "Try a new healthy recipe today.",
            "Regular massages can help you relieve stress."
        });

        healthMessages.put("Gemini", new String[]{
            "Keep your mind sharp with brain exercises.",
            "Reduce caffeine intake for better sleep.",
            "Fresh air will clear your mind and improve focus.",
            "Journaling will help organize your thoughts.",
            "Social interactions are important for your well-being."
        });

        healthMessages.put("Cancer", new String[]{
            "Focus on emotional well-being through self-care.",
            "A warm bath will relax your muscles and mind.",
            "Be mindful of your eating habits and avoid stress eating.",
            "Prioritize sleep to maintain emotional balance.",
            "Stay connected with loved ones for emotional support."
        });

        healthMessages.put("Leo", new String[]{
            "Physical activity will boost your confidence.",
            "Avoid overexertion; balance work and rest.",
            "Spending time in the sun will lift your mood.",
            "Healthy competition is good, but don’t stress too much.",
            "Proper hydration will keep your skin glowing."
        });

        healthMessages.put("Virgo", new String[]{
            "Focus on digestive health by eating fiber-rich foods.",
            "Yoga or meditation will help calm your mind.",
            "Avoid overanalyzing; let things flow naturally.",
            "Decluttering your space can improve mental clarity.",
            "Don’t ignore minor health concerns; take action early."
        });

        healthMessages.put("Libra", new String[]{
            "Maintain balance between work and relaxation.",
            "Stretching exercises will improve your posture.",
            "Self-care is essential; treat yourself kindly.",
            "Surround yourself with peaceful environments.",
            "Deep breathing exercises will bring mental clarity."
        });

        healthMessages.put("Scorpio", new String[]{
            "Regular detoxing will help you feel lighter.",
            "Release negative emotions for better mental health.",
            "Stay hydrated to maintain your energy levels.",
            "Passionate activities will help relieve stress.",
            "Listen to your body’s signals; rest when needed."
        });

        healthMessages.put("Sagittarius", new String[]{
            "Outdoor activities will keep you energized.",
            "Stretching before physical activities prevents injuries.",
            "Try a new healthy dish for variety in your diet.",
            "Traveling can refresh your mind and soul.",
            "Positive thinking will boost your immune system."
        });

        healthMessages.put("Capricorn", new String[]{
            "Consistency in health habits will bring long-term benefits.",
            "Proper rest will improve your work performance.",
            "Warm-up before exercise to avoid stiffness.",
            "Avoid excessive stress; take time to relax.",
            "Maintain a strong posture to prevent back pain."
        });

        healthMessages.put("Aquarius", new String[]{
            "Mental stimulation is just as important as physical health.",
            "A creative hobby will help relieve stress.",
            "Keep your nervous system balanced with meditation.",
            "Experiment with healthy smoothies for better nutrition.",
            "Spend time in fresh air for clarity of thought."
        });

        healthMessages.put("Pisces", new String[]{
            "Listen to calming music to ease anxiety.",
            "Gentle exercises like swimming will benefit you.",
            "Aromatherapy can help you feel relaxed and refreshed.",
            "Keep a dream journal to understand your subconscious.",
            "Taking time alone will recharge your energy."
        });

        Random random = new Random();
        String[] messages = healthMessages.getOrDefault(zodiacSign, new String[]{"Take care of yourself, your health is important!"});

        return "Health: " + messages[random.nextInt(messages.length)];
    }

    private String getLoveMessageForSign(String zodiacSign) {
        Map<String, String[]> loveMessages = new HashMap<>();

        loveMessages.put("Aries", new String[]{
            "Take the initiative in love today!",
            "A romantic surprise might make your day special.",
            "Your passion will make your partner feel special.",
            "Don’t be afraid to express your feelings!",
            "Love needs a balance between passion and patience."
        });

        loveMessages.put("Taurus", new String[]{
            "Your love will last if you invest time in it.",
            "A delicious meal or small gesture will warm up your love.",
            "Your loyalty is what makes your love strong.",
            "Don't be afraid to open your heart, love sometimes requires risk.",
            "Slow and steady, love will blossom at the right time."
        });

        loveMessages.put("Gemini", new String[]{
            "An interesting conversation may spark special feelings.",
            "Love is about communication, listen more.",
            "A spontaneous message might brighten someone's day.",
            "Be flexible in love, don't be too rigid.",
            "Your curiosity and humor are your most charming traits!"
        });

        loveMessages.put("Cancer", new String[]{
            "Your love is built on genuine care and affection.",
            "Don't hesitate to show your emotions; your partner will appreciate it.",
            "A deep conversation could strengthen your relationship.",
            "Your warmth provides a sense of security for your loved one.",
            "Trust your intuition when it comes to love."
        });

        loveMessages.put("Leo", new String[]{
            "Today is your day to shine in love!",
            "A sincere compliment will make love even brighter.",
            "Take the lead in creating a special moment for your partner.",
            "Love requires pride, but also humility.",
            "Your confidence is what makes you irresistible to your partner."
        });

        loveMessages.put("Virgo", new String[]{
            "Your love is shown through small, thoughtful actions.",
            "Don't worry too much about perfection; enjoy the moment.",
            "Honesty is the most important thing in love.",
            "Trust the process; love will develop naturally.",
            "A small act of kindness can have a big impact."
        });

        loveMessages.put("Libra", new String[]{
            "Find balance in your relationship.",
            "A romantic date can rekindle the spark in love.",
            "Your charm attracts attention wherever you go.",
            "Don't be afraid to express your desires in love.",
            "Harmony and understanding will strengthen your relationship."
        });

        loveMessages.put("Scorpio", new String[]{
            "Your love is intense and deep; embrace it!",
            "Honesty will make your love even stronger.",
            "Follow your heart, but don't let doubt take over.",
            "A small change could bring a fresh start.",
            "Remember, love is about trust, not control."
        });

        loveMessages.put("Sagittarius", new String[]{
            "Love is an adventure; enjoy it!",
            "An exciting conversation may take your relationship to new heights.",
            "Be open to love; it may come from unexpected places.",
            "Your sense of humor is the key to maintaining love.",
            "Don't be afraid to try something new in love today!"
        });

        loveMessages.put("Capricorn", new String[]{
            "Your patience will help love grow steadily.",
            "A simple gesture can make a big impact on your relationship.",
            "Love is not just responsibility, but also joy.",
            "Don't let work make you forget the most important person.",
            "A sincere promise will strengthen trust in love."
        });

        loveMessages.put("Aquarius", new String[]{
            "Your love is creative and unique.",
            "Take time to connect on a deeper level with your partner.",
            "A spontaneous act of love can make someone's day.",
            "Independence is strength, but don’t forget about connection.",
            "A fresh idea could bring new excitement to your love life."
        });

        loveMessages.put("Pisces", new String[]{
            "Your love is emotional and romantic; cherish it.",
            "A dream might bring a message about love.",
            "Follow your heart, but also listen to reason.",
            "Love is about sharing; be a good listener.",
            "A romantic moment could make today truly special."
        });

        Random random = new Random();
        String[] messages = loveMessages.getOrDefault(zodiacSign, new String[]{"Open your heart, love may come from the simplest things."});
        return "Love: " + messages[random.nextInt(messages.length)];
    }

    private String getStudyMessageForSign(String zodiacSign) {
        Map<String, String[]> studyMessages = new HashMap<>();

        studyMessages.put("Aries", new String[]{
            "Stay focused and push forward with determination.",
            "Challenge yourself with a new learning goal today.",
            "Your competitive nature can help you succeed in studies.",
            "Take short breaks to maintain high energy.",
            "Act quickly on your ideas for effective learning."
        });

        studyMessages.put("Taurus", new String[]{
            "Consistency is key to mastering any subject.",
            "Create a comfortable study environment for better focus.",
            "Your patience will help you absorb difficult concepts.",
            "Take handwritten notes to retain information better.",
            "Slow and steady progress leads to lasting knowledge."
        });

        studyMessages.put("Gemini", new String[]{
            "Engage in discussions to deepen your understanding.",
            "Stay curious and explore different perspectives.",
            "Use creative methods like mind maps to study effectively.",
            "Break large topics into smaller sections for easy learning.",
            "Teaching someone else will help you remember better."
        });

        studyMessages.put("Cancer", new String[]{
            "Trust your instincts when solving problems.",
            "A calm environment will help you concentrate.",
            "Emotional balance is crucial for effective studying.",
            "Connecting subjects to personal experiences enhances learning.",
            "Take breaks to recharge your mind."
        });

        studyMessages.put("Leo", new String[]{
            "Turn studying into a fun and engaging activity.",
            "Confidence in your abilities will lead to success.",
            "Be a leader in group discussions and help others learn.",
            "Stay motivated by setting ambitious study goals.",
            "Presenting your ideas will strengthen your knowledge."
        });

        studyMessages.put("Virgo", new String[]{
            "Your attention to detail will help you master any subject.",
            "Stay organized and create a study plan.",
            "Perfection is not necessary, but consistency is.",
            "Take time to review and refine your knowledge.",
            "Your analytical mind will help you solve complex problems."
        });

        studyMessages.put("Libra", new String[]{
            "Balance your study and relaxation time wisely.",
            "Group studies will help you gain new insights.",
            "Aesthetic and structured notes will improve your learning.",
            "Diplomacy helps—learn through discussion and cooperation.",
            "Seek harmony in your learning environment."
        });

        studyMessages.put("Scorpio", new String[]{
            "Dive deep into your studies; understanding is better than memorization.",
            "Your focus will help you master difficult topics.",
            "Research beyond textbooks to expand your knowledge.",
            "Learning is a journey—trust your instincts.",
            "Challenge yourself with complex subjects to grow intellectually."
        });

        studyMessages.put("Sagittarius", new String[]{
            "Broaden your knowledge by exploring different cultures and perspectives.",
            "Your curiosity makes you a natural learner.",
            "Studying while traveling or in nature may inspire you.",
            "Philosophical debates will help deepen your understanding.",
            "Expand your horizons by reading about new ideas."
        });

        studyMessages.put("Capricorn", new String[]{
            "Discipline and hard work will lead to academic success.",
            "Create a structured study routine and stick to it.",
            "Long-term goals require patience and persistence.",
            "Your ambition will push you to achieve great results.",
            "Stay committed; every small effort counts."
        });

        studyMessages.put("Aquarius", new String[]{
            "Innovative thinking will help you grasp new concepts quickly.",
            "Use technology to enhance your learning experience.",
            "Group discussions will inspire new ideas.",
            "Think outside the box for creative solutions.",
            "Your unique perspective makes you a great problem solver."
        });

        studyMessages.put("Pisces", new String[]{
            "Creative visualization will help you remember concepts.",
            "Music might enhance your study focus.",
            "Trust your intuition when learning new topics.",
            "Stay inspired by connecting learning to your dreams.",
            "A calm and peaceful environment boosts your focus."
        });

        Random random = new Random();
        String[] messages = studyMessages.getOrDefault(zodiacSign, new String[]{"Stay curious and keep learning!"});
        return "Study: " + messages[random.nextInt(messages.length)];
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
