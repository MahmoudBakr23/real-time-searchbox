# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
articles_data = [
  {
    title: "The Benefits of Mindful Meditation",
    body: "Explore the positive impacts of mindful meditation on mental well-being, stress reduction, and overall health. Learn practical tips to incorporate mindfulness into your daily routine."
  },
  {
    title: "The Rise of Sustainable Fashion",
    body: "Delve into the growing trend of sustainable fashion, discussing eco-friendly materials, ethical practices, and the impact on the environment. Discover how consumers can contribute to a more sustainable industry."
  },
  {
    title: "The Power of Positive Habits",
    body: "Uncover the science behind habit formation and its influence on personal development. Learn how cultivating positive habits can lead to long-term success and happiness."
  },
  {
    title: "Exploring the Wonders of Astrophotography",
    body: "Journey into the world of astrophotography, discovering the techniques and equipment needed to capture stunning images of the night sky. Get inspired to explore the cosmos through your camera lens."
  },
  {
    title: "The Art of Effective Communication in the Digital Age",
    body: "Navigate the challenges of communication in the digital era, discussing the impact of technology on interpersonal relationships and offering tips for effective online communication."
  },
  {
    title: "Culinary Adventures: Exploring Global Cuisines",
    body: "Embark on a culinary journey as we explore diverse global cuisines. From exotic flavors to unique cooking techniques, discover the richness and variety of dishes from around the world."
  },
  {
    title: "The Impact of Artificial Intelligence on Everyday Life",
    body: "Examine the role of artificial intelligence in shaping our daily experiences, from virtual assistants to smart homes. Discuss the potential benefits and challenges of AI integration into our lives."
  },
  {
    title: "Mind-Body Connection: The Link Between Physical and Mental Health",
    body: "Investigate the intricate connection between physical and mental well-being, exploring how exercise and healthy habits can positively impact mental health."
  },
  {
    title: "The Beauty of Nature: Benefits of Outdoor Activities",
    body: "Celebrate the therapeutic effects of outdoor activities on mental and physical health. From hiking to gardening, discover the joy and well-being found in connecting with nature."
  },
  {
    title: "Unveiling the Secrets of Productivity",
    body: "Dive into the strategies and techniques for enhancing productivity in both personal and professional life. Learn how to prioritize tasks, overcome procrastination, and achieve meaningful results."
  }
]

# Create articles from the array of hashes
Article.create(articles_data)

# Display a confirmation message
puts "Seed data created successfully!"