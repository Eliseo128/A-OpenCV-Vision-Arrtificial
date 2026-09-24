import cv2
img = cv2.imread('girl-original.jpeg')
print(type(img))
print(img.shape)

cv2.imshow('Image', img)
cv2.waitKey(0)
cv2.destroyAllWindows()

small = cv2.resize(img, (0,0), fx=0.5, fy=0.5)
cv2.imshow('Small Image', small)
cv2.waitKey(0)
cv2.destroyAllWindows()

print(small.shape)
small[0,0]
small[0,0] = (255,255,255)

print(small[0,0])

cv2.imshow('Small Image Final', small)
cv2.waitKey(0)
cv2.destroyAllWindows()


small[0:100,0:10] = (0,0,255)
cv2.imshow('Small Image Final Marked', small)
cv2.waitKey(0)
cv2.destroyAllWindows()



gray = cv2.cvtColor(small, cv2.COLOR_BGR2GRAY)
print(gray.shape)

cv2.imshow('Gray Image', gray)
cv2.waitKey(0)
cv2.destroyAllWindows()