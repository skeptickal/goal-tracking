import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
public class MakeAPICallToNotion { 
    private static final String NOTION_API_KEY = "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"; // Replace with your API key
    private static final String PARENT_PAGE_ID = "7b562caa3b6a4cb88d08f30969cc6a92"; // Replace with your Notion page ID 7b562caa-3b6a-4cb8-8d08-f30969cc6a92 521fc223-8d87-40ed-bfa7-9accdcaa6252
    private static final String NOTION_API_URL = "https://api.notion.com/v1/pages"; // https://www.notion.so/7b562caa3b6a4cb88d08f30969cc6a92?v=521fc2238d8740edbfa79accdcaa6252&pvs=4

    public static void main(String[] args) {
        try {
            createNotionPage();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public static void createNotionPage() throws Exception {
        // Define JSON request body
        String jsonInputString = "{"
                + "\"parent\": { \"database_id\": \"" + PARENT_PAGE_ID + "\" },"
                + "\"properties\": {"
                + "  \"title\": {"
                + "    \"title\": [{ \"type\": \"text\", \"text\": { \"content\": \"A note from your pals at Notion\" } }]"
                + "  }"
                + "},"
                + "\"children\": ["
                + "  {"
                + "    \"object\": \"block\","
                + "    \"type\": \"paragraph\","
                + "    \"paragraph\": {"
                + "      \"rich_text\": [{ \"type\": \"text\", \"text\": { \"content\": \"You made this page using the Notion API. Pretty cool, huh? We hope you enjoy building with us.\" } }]"
                + "    }"
                + "  }"
                + "]"
                + "}";

        // Create URL object
        URL url = new URL(NOTION_API_URL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        // Set request headers
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "Bearer " + NOTION_API_KEY);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("Notion-Version", "2022-06-28");
        conn.setDoOutput(true);

        // Send JSON request body
        try (OutputStream os = conn.getOutputStream()) {
            byte[] input = jsonInputString.getBytes(StandardCharsets.UTF_8);
            os.write(input, 0, input.length);
        }

        // Get response
        int responseCode = conn.getResponseCode();
        if (responseCode == 200 || responseCode == 201) {
            System.out.println("Notion page created successfully!");
        } else {
            System.out.println("Failed to create Notion page. Response Code: " + responseCode);
        }

        conn.disconnect();
    }
}
