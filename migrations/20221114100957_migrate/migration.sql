/*
  Warnings:

  - You are about to drop the column `canManageCart` on the `Role` table. All the data in the column will be lost.
  - You are about to drop the column `canManageOrders` on the `Role` table. All the data in the column will be lost.
  - You are about to drop the column `canManageProducts` on the `Role` table. All the data in the column will be lost.
  - You are about to drop the `CartItem` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Order` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `OrderItem` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Product` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProductImage` table. If the table is not empty, all the data it contains will be lost.

*/
-- CreateEnum
CREATE TYPE "ArticleStatusType" AS ENUM ('active', 'inactive');

-- CreateEnum
CREATE TYPE "AnimalStatusType" AS ENUM ('active', 'inactive');

-- CreateEnum
CREATE TYPE "EventStatusType" AS ENUM ('active', 'inactive');

-- CreateEnum
CREATE TYPE "PageStatusType" AS ENUM ('active', 'inactive');

-- CreateEnum
CREATE TYPE "TraitStatusType" AS ENUM ('active', 'inactive');

-- CreateEnum
CREATE TYPE "GroupStatusType" AS ENUM ('active', 'inactive');

-- CreateEnum
CREATE TYPE "PostStatusType" AS ENUM ('active', 'inactive');

-- CreateEnum
CREATE TYPE "CustomerStatusType" AS ENUM ('active', 'inactive');

-- CreateEnum
CREATE TYPE "ListingStatusType" AS ENUM ('active', 'inactive');

-- CreateEnum
CREATE TYPE "StoreStatusType" AS ENUM ('active', 'inactive');

-- CreateEnum
CREATE TYPE "CollectionStatusType" AS ENUM ('active', 'inactive');

-- CreateEnum
CREATE TYPE "AssetFolderType" AS ENUM ('active', 'inactive');

-- CreateEnum
CREATE TYPE "AssetStatusType" AS ENUM ('active', 'inactive');

-- CreateEnum
CREATE TYPE "UserStatusType" AS ENUM ('active', 'inactive');

-- CreateEnum
CREATE TYPE "OrganizationStatusType" AS ENUM ('active', 'inactive');

-- CreateEnum
CREATE TYPE "GlobalStatusType" AS ENUM ('active', 'inactive');

-- CreateEnum
CREATE TYPE "SubscriptionStatusType" AS ENUM ('active', 'inactive');

-- CreateEnum
CREATE TYPE "SettingStatusType" AS ENUM ('active', 'inactive');

-- DropForeignKey
ALTER TABLE "CartItem" DROP CONSTRAINT "CartItem_product_fkey";

-- DropForeignKey
ALTER TABLE "CartItem" DROP CONSTRAINT "CartItem_user_fkey";

-- DropForeignKey
ALTER TABLE "Order" DROP CONSTRAINT "Order_user_fkey";

-- DropForeignKey
ALTER TABLE "OrderItem" DROP CONSTRAINT "OrderItem_order_fkey";

-- DropForeignKey
ALTER TABLE "OrderItem" DROP CONSTRAINT "OrderItem_photo_fkey";

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_photo_fkey";

-- DropForeignKey
ALTER TABLE "Product" DROP CONSTRAINT "Product_user_fkey";

-- AlterTable
ALTER TABLE "Role" DROP COLUMN "canManageCart",
DROP COLUMN "canManageOrders",
DROP COLUMN "canManageProducts",
ADD COLUMN     "canManageAnimal" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "canManageArticle" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "canManageEvent" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "canManageListing" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "canManagePage" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "canManageTrait" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "canReadListing" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "description" TEXT NOT NULL DEFAULT E'',
ADD COLUMN     "handle" TEXT NOT NULL DEFAULT E'',
ADD COLUMN     "permissions" BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "about" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]',
ADD COLUMN     "avatar" TEXT,
ADD COLUMN     "customer" TEXT,
ADD COLUMN     "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN     "firstName" TEXT NOT NULL DEFAULT E'',
ADD COLUMN     "lastName" TEXT NOT NULL DEFAULT E'',
ADD COLUMN     "metadata" JSONB,
ADD COLUMN     "organizationMembers" TEXT,
ADD COLUMN     "status" "UserStatusType";

-- DropTable
DROP TABLE "CartItem";

-- DropTable
DROP TABLE "Order";

-- DropTable
DROP TABLE "OrderItem";

-- DropTable
DROP TABLE "Product";

-- DropTable
DROP TABLE "ProductImage";

-- CreateTable
CREATE TABLE "Article" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL DEFAULT E'',
    "slug" TEXT NOT NULL DEFAULT E'',
    "articleType" TEXT,
    "content" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]',
    "status" "ArticleStatusType",
    "featuredImage" TEXT,
    "author" TEXT,
    "seoTitle" TEXT NOT NULL DEFAULT E'',
    "seoDescription" TEXT NOT NULL DEFAULT E'',
    "seoImage" TEXT,
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Article_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Animal" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT E'',
    "slug" TEXT NOT NULL DEFAULT E'',
    "animalType" TEXT,
    "scientificName" TEXT NOT NULL DEFAULT E'',
    "content" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]',
    "status" "AnimalStatusType",
    "featuredImage" TEXT,
    "author" TEXT,
    "tags" TEXT,
    "seoTitle" TEXT NOT NULL DEFAULT E'',
    "seoDescription" TEXT NOT NULL DEFAULT E'',
    "seoImage" TEXT,
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Animal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Event" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT E'',
    "slug" TEXT NOT NULL DEFAULT E'',
    "eventType" TEXT,
    "content" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]',
    "location" JSONB,
    "startDate" TIMESTAMP(3),
    "endDate" TIMESTAMP(3),
    "featuredImage" TEXT,
    "media" TEXT,
    "author" TEXT,
    "status" "EventStatusType",
    "seoTitle" TEXT NOT NULL DEFAULT E'',
    "seoDescription" TEXT NOT NULL DEFAULT E'',
    "seoImage" TEXT,
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Event_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Page" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL DEFAULT E'',
    "slug" TEXT NOT NULL DEFAULT E'',
    "pageType" TEXT,
    "content" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]',
    "status" "PageStatusType",
    "author" TEXT,
    "seoTitle" TEXT NOT NULL DEFAULT E'',
    "seoDescription" TEXT NOT NULL DEFAULT E'',
    "seoImage" TEXT,
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Page_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Trait" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT E'',
    "slug" TEXT NOT NULL DEFAULT E'',
    "animalType" TEXT,
    "content" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]',
    "status" "TraitStatusType",
    "featuredImage" TEXT,
    "author" TEXT,
    "seoTitle" TEXT NOT NULL DEFAULT E'',
    "seoDescription" TEXT NOT NULL DEFAULT E'',
    "seoImage" TEXT,
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Trait_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Group" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT E'',
    "handle" TEXT NOT NULL DEFAULT E'',
    "description" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]',
    "status" "GroupStatusType",
    "featuredImage" TEXT,
    "author" TEXT,
    "seoTitle" TEXT NOT NULL DEFAULT E'',
    "seoDescription" TEXT NOT NULL DEFAULT E'',
    "seoImage" TEXT,

    CONSTRAINT "Group_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Post" (
    "id" TEXT NOT NULL,
    "streamActivityId" TEXT NOT NULL DEFAULT E'',
    "group" TEXT,
    "status" "PostStatusType",
    "author" TEXT,
    "seoTitle" TEXT NOT NULL DEFAULT E'',
    "seoDescription" TEXT NOT NULL DEFAULT E'',
    "seoImage" TEXT,
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Customer" (
    "id" TEXT NOT NULL,
    "customerType" TEXT,
    "stripeCustomerId" TEXT NOT NULL DEFAULT E'',
    "subscription" TEXT,
    "status" "CustomerStatusType",
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Customer_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Listing" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL DEFAULT E'',
    "slug" TEXT NOT NULL DEFAULT E'',
    "listingType" TEXT,
    "price" TEXT NOT NULL DEFAULT E'',
    "description" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]',
    "store" TEXT,
    "stripeProductId" TEXT NOT NULL DEFAULT E'',
    "status" "ListingStatusType",
    "featuredImage" TEXT,
    "media" TEXT,
    "author" TEXT,
    "seoTitle" TEXT NOT NULL DEFAULT E'',
    "seoDescription" TEXT NOT NULL DEFAULT E'',
    "seoImage" TEXT,
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Listing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Store" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT E'',
    "slug" TEXT NOT NULL DEFAULT E'',
    "storeType" TEXT,
    "description" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]',
    "location" JSONB,
    "stripeStoreId" TEXT NOT NULL DEFAULT E'',
    "status" "StoreStatusType",
    "featuredImage" TEXT,
    "media" TEXT,
    "author" TEXT,
    "seoTitle" TEXT NOT NULL DEFAULT E'',
    "seoDescription" TEXT NOT NULL DEFAULT E'',
    "seoImage" TEXT,
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Store_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Category" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL DEFAULT E'',
    "handle" TEXT NOT NULL DEFAULT E'',
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Collection" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL DEFAULT E'',
    "handle" TEXT NOT NULL DEFAULT E'',
    "author" TEXT,
    "status" "CollectionStatusType",
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Collection_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Structure" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT E'',
    "handle" TEXT NOT NULL DEFAULT E'',
    "structure" JSONB,
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Structure_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tag" (
    "id" TEXT NOT NULL,
    "title" TEXT NOT NULL DEFAULT E'',
    "handle" TEXT NOT NULL DEFAULT E'',
    "tagType" TEXT,
    "organizations" TEXT,
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Tag_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Asset" (
    "id" TEXT NOT NULL,
    "file_filesize" INTEGER,
    "file_mode" TEXT,
    "file_filename" TEXT,
    "folder" "AssetFolderType",
    "altTitle" TEXT NOT NULL DEFAULT E'',
    "caption" TEXT NOT NULL DEFAULT E'',
    "status" "AssetStatusType",
    "author" TEXT,
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Asset_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Organization" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT E'',
    "slug" TEXT NOT NULL DEFAULT E'',
    "organizationType" TEXT,
    "description" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]',
    "status" "OrganizationStatusType",
    "featuredImage" TEXT,
    "author" TEXT,
    "seoTitle" TEXT NOT NULL DEFAULT E'',
    "seoDescription" TEXT NOT NULL DEFAULT E'',
    "seoImage" TEXT,
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Organization_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Global" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT E'',
    "handle" TEXT NOT NULL DEFAULT E'',
    "data" JSONB,
    "author" TEXT,
    "status" "GlobalStatusType",
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Global_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Subscription" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT E'',
    "handle" TEXT NOT NULL DEFAULT E'',
    "subscriptionType" TEXT,
    "description" JSONB NOT NULL DEFAULT '[{"type":"paragraph","children":[{"text":""}]}]',
    "stripeSubscriptionId" TEXT NOT NULL DEFAULT E'',
    "status" "SubscriptionStatusType",
    "featuredImage" TEXT,
    "author" TEXT,
    "seoTitle" TEXT NOT NULL DEFAULT E'',
    "seoDescription" TEXT NOT NULL DEFAULT E'',
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Subscription_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Setting" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT E'',
    "handle" TEXT NOT NULL DEFAULT E'',
    "data" JSONB,
    "author" TEXT,
    "status" "SettingStatusType",
    "dateCreated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "dateUpdated" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Setting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_Article_media" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Article_tags" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Animal_media" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Event_vendors" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Event_tags" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Page_tags" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Group_members" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Group_moderators" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Group_tags" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Post_tags" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Listing_tags" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Store_tags" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Collection_tags" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Tag_traits" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Asset_tags" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Trait_media" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Group_media" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Organization_media" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Subscription_media" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Subscription_seoImage" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_User_followers" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_Organization_stores" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE INDEX "Article_articleType_idx" ON "Article"("articleType");

-- CreateIndex
CREATE INDEX "Article_featuredImage_idx" ON "Article"("featuredImage");

-- CreateIndex
CREATE INDEX "Article_author_idx" ON "Article"("author");

-- CreateIndex
CREATE INDEX "Article_seoImage_idx" ON "Article"("seoImage");

-- CreateIndex
CREATE INDEX "Animal_animalType_idx" ON "Animal"("animalType");

-- CreateIndex
CREATE INDEX "Animal_featuredImage_idx" ON "Animal"("featuredImage");

-- CreateIndex
CREATE INDEX "Animal_author_idx" ON "Animal"("author");

-- CreateIndex
CREATE INDEX "Animal_tags_idx" ON "Animal"("tags");

-- CreateIndex
CREATE INDEX "Animal_seoImage_idx" ON "Animal"("seoImage");

-- CreateIndex
CREATE INDEX "Event_eventType_idx" ON "Event"("eventType");

-- CreateIndex
CREATE INDEX "Event_featuredImage_idx" ON "Event"("featuredImage");

-- CreateIndex
CREATE INDEX "Event_media_idx" ON "Event"("media");

-- CreateIndex
CREATE INDEX "Event_author_idx" ON "Event"("author");

-- CreateIndex
CREATE INDEX "Event_seoImage_idx" ON "Event"("seoImage");

-- CreateIndex
CREATE INDEX "Page_pageType_idx" ON "Page"("pageType");

-- CreateIndex
CREATE INDEX "Page_author_idx" ON "Page"("author");

-- CreateIndex
CREATE INDEX "Page_seoImage_idx" ON "Page"("seoImage");

-- CreateIndex
CREATE INDEX "Trait_animalType_idx" ON "Trait"("animalType");

-- CreateIndex
CREATE INDEX "Trait_featuredImage_idx" ON "Trait"("featuredImage");

-- CreateIndex
CREATE INDEX "Trait_author_idx" ON "Trait"("author");

-- CreateIndex
CREATE INDEX "Trait_seoImage_idx" ON "Trait"("seoImage");

-- CreateIndex
CREATE INDEX "Group_featuredImage_idx" ON "Group"("featuredImage");

-- CreateIndex
CREATE INDEX "Group_author_idx" ON "Group"("author");

-- CreateIndex
CREATE INDEX "Group_seoImage_idx" ON "Group"("seoImage");

-- CreateIndex
CREATE INDEX "Post_group_idx" ON "Post"("group");

-- CreateIndex
CREATE INDEX "Post_author_idx" ON "Post"("author");

-- CreateIndex
CREATE INDEX "Post_seoImage_idx" ON "Post"("seoImage");

-- CreateIndex
CREATE INDEX "Customer_customerType_idx" ON "Customer"("customerType");

-- CreateIndex
CREATE INDEX "Customer_subscription_idx" ON "Customer"("subscription");

-- CreateIndex
CREATE UNIQUE INDEX "Listing_store_key" ON "Listing"("store");

-- CreateIndex
CREATE INDEX "Listing_listingType_idx" ON "Listing"("listingType");

-- CreateIndex
CREATE INDEX "Listing_featuredImage_idx" ON "Listing"("featuredImage");

-- CreateIndex
CREATE INDEX "Listing_media_idx" ON "Listing"("media");

-- CreateIndex
CREATE INDEX "Listing_author_idx" ON "Listing"("author");

-- CreateIndex
CREATE INDEX "Listing_seoImage_idx" ON "Listing"("seoImage");

-- CreateIndex
CREATE INDEX "Store_storeType_idx" ON "Store"("storeType");

-- CreateIndex
CREATE INDEX "Store_featuredImage_idx" ON "Store"("featuredImage");

-- CreateIndex
CREATE INDEX "Store_media_idx" ON "Store"("media");

-- CreateIndex
CREATE INDEX "Store_author_idx" ON "Store"("author");

-- CreateIndex
CREATE INDEX "Store_seoImage_idx" ON "Store"("seoImage");

-- CreateIndex
CREATE INDEX "Collection_author_idx" ON "Collection"("author");

-- CreateIndex
CREATE INDEX "Tag_tagType_idx" ON "Tag"("tagType");

-- CreateIndex
CREATE INDEX "Tag_organizations_idx" ON "Tag"("organizations");

-- CreateIndex
CREATE UNIQUE INDEX "Asset_author_key" ON "Asset"("author");

-- CreateIndex
CREATE UNIQUE INDEX "Organization_author_key" ON "Organization"("author");

-- CreateIndex
CREATE INDEX "Organization_organizationType_idx" ON "Organization"("organizationType");

-- CreateIndex
CREATE INDEX "Organization_featuredImage_idx" ON "Organization"("featuredImage");

-- CreateIndex
CREATE INDEX "Organization_seoImage_idx" ON "Organization"("seoImage");

-- CreateIndex
CREATE INDEX "Global_author_idx" ON "Global"("author");

-- CreateIndex
CREATE INDEX "Subscription_subscriptionType_idx" ON "Subscription"("subscriptionType");

-- CreateIndex
CREATE INDEX "Subscription_featuredImage_idx" ON "Subscription"("featuredImage");

-- CreateIndex
CREATE INDEX "Subscription_author_idx" ON "Subscription"("author");

-- CreateIndex
CREATE INDEX "Setting_author_idx" ON "Setting"("author");

-- CreateIndex
CREATE UNIQUE INDEX "_Article_media_AB_unique" ON "_Article_media"("A", "B");

-- CreateIndex
CREATE INDEX "_Article_media_B_index" ON "_Article_media"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Article_tags_AB_unique" ON "_Article_tags"("A", "B");

-- CreateIndex
CREATE INDEX "_Article_tags_B_index" ON "_Article_tags"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Animal_media_AB_unique" ON "_Animal_media"("A", "B");

-- CreateIndex
CREATE INDEX "_Animal_media_B_index" ON "_Animal_media"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Event_vendors_AB_unique" ON "_Event_vendors"("A", "B");

-- CreateIndex
CREATE INDEX "_Event_vendors_B_index" ON "_Event_vendors"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Event_tags_AB_unique" ON "_Event_tags"("A", "B");

-- CreateIndex
CREATE INDEX "_Event_tags_B_index" ON "_Event_tags"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Page_tags_AB_unique" ON "_Page_tags"("A", "B");

-- CreateIndex
CREATE INDEX "_Page_tags_B_index" ON "_Page_tags"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Group_members_AB_unique" ON "_Group_members"("A", "B");

-- CreateIndex
CREATE INDEX "_Group_members_B_index" ON "_Group_members"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Group_moderators_AB_unique" ON "_Group_moderators"("A", "B");

-- CreateIndex
CREATE INDEX "_Group_moderators_B_index" ON "_Group_moderators"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Group_tags_AB_unique" ON "_Group_tags"("A", "B");

-- CreateIndex
CREATE INDEX "_Group_tags_B_index" ON "_Group_tags"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Post_tags_AB_unique" ON "_Post_tags"("A", "B");

-- CreateIndex
CREATE INDEX "_Post_tags_B_index" ON "_Post_tags"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Listing_tags_AB_unique" ON "_Listing_tags"("A", "B");

-- CreateIndex
CREATE INDEX "_Listing_tags_B_index" ON "_Listing_tags"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Store_tags_AB_unique" ON "_Store_tags"("A", "B");

-- CreateIndex
CREATE INDEX "_Store_tags_B_index" ON "_Store_tags"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Collection_tags_AB_unique" ON "_Collection_tags"("A", "B");

-- CreateIndex
CREATE INDEX "_Collection_tags_B_index" ON "_Collection_tags"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Tag_traits_AB_unique" ON "_Tag_traits"("A", "B");

-- CreateIndex
CREATE INDEX "_Tag_traits_B_index" ON "_Tag_traits"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Asset_tags_AB_unique" ON "_Asset_tags"("A", "B");

-- CreateIndex
CREATE INDEX "_Asset_tags_B_index" ON "_Asset_tags"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Trait_media_AB_unique" ON "_Trait_media"("A", "B");

-- CreateIndex
CREATE INDEX "_Trait_media_B_index" ON "_Trait_media"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Group_media_AB_unique" ON "_Group_media"("A", "B");

-- CreateIndex
CREATE INDEX "_Group_media_B_index" ON "_Group_media"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Organization_media_AB_unique" ON "_Organization_media"("A", "B");

-- CreateIndex
CREATE INDEX "_Organization_media_B_index" ON "_Organization_media"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Subscription_media_AB_unique" ON "_Subscription_media"("A", "B");

-- CreateIndex
CREATE INDEX "_Subscription_media_B_index" ON "_Subscription_media"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Subscription_seoImage_AB_unique" ON "_Subscription_seoImage"("A", "B");

-- CreateIndex
CREATE INDEX "_Subscription_seoImage_B_index" ON "_Subscription_seoImage"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_User_followers_AB_unique" ON "_User_followers"("A", "B");

-- CreateIndex
CREATE INDEX "_User_followers_B_index" ON "_User_followers"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_Organization_stores_AB_unique" ON "_Organization_stores"("A", "B");

-- CreateIndex
CREATE INDEX "_Organization_stores_B_index" ON "_Organization_stores"("B");

-- CreateIndex
CREATE INDEX "User_avatar_idx" ON "User"("avatar");

-- CreateIndex
CREATE INDEX "User_customer_idx" ON "User"("customer");

-- CreateIndex
CREATE INDEX "User_organizationMembers_idx" ON "User"("organizationMembers");

-- AddForeignKey
ALTER TABLE "Article" ADD CONSTRAINT "Article_articleType_fkey" FOREIGN KEY ("articleType") REFERENCES "Structure"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Article" ADD CONSTRAINT "Article_featuredImage_fkey" FOREIGN KEY ("featuredImage") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Article" ADD CONSTRAINT "Article_seoImage_fkey" FOREIGN KEY ("seoImage") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Article" ADD CONSTRAINT "Article_author_fkey" FOREIGN KEY ("author") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Animal" ADD CONSTRAINT "Animal_animalType_fkey" FOREIGN KEY ("animalType") REFERENCES "Structure"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Animal" ADD CONSTRAINT "Animal_tags_fkey" FOREIGN KEY ("tags") REFERENCES "Tag"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Animal" ADD CONSTRAINT "Animal_featuredImage_fkey" FOREIGN KEY ("featuredImage") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Animal" ADD CONSTRAINT "Animal_seoImage_fkey" FOREIGN KEY ("seoImage") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Animal" ADD CONSTRAINT "Animal_author_fkey" FOREIGN KEY ("author") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Event" ADD CONSTRAINT "Event_eventType_fkey" FOREIGN KEY ("eventType") REFERENCES "Structure"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Event" ADD CONSTRAINT "Event_featuredImage_fkey" FOREIGN KEY ("featuredImage") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Event" ADD CONSTRAINT "Event_media_fkey" FOREIGN KEY ("media") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Event" ADD CONSTRAINT "Event_seoImage_fkey" FOREIGN KEY ("seoImage") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Event" ADD CONSTRAINT "Event_author_fkey" FOREIGN KEY ("author") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Page" ADD CONSTRAINT "Page_pageType_fkey" FOREIGN KEY ("pageType") REFERENCES "Structure"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Page" ADD CONSTRAINT "Page_seoImage_fkey" FOREIGN KEY ("seoImage") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Page" ADD CONSTRAINT "Page_author_fkey" FOREIGN KEY ("author") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trait" ADD CONSTRAINT "Trait_animalType_fkey" FOREIGN KEY ("animalType") REFERENCES "Structure"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trait" ADD CONSTRAINT "Trait_featuredImage_fkey" FOREIGN KEY ("featuredImage") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trait" ADD CONSTRAINT "Trait_seoImage_fkey" FOREIGN KEY ("seoImage") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trait" ADD CONSTRAINT "Trait_author_fkey" FOREIGN KEY ("author") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Group" ADD CONSTRAINT "Group_featuredImage_fkey" FOREIGN KEY ("featuredImage") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Group" ADD CONSTRAINT "Group_seoImage_fkey" FOREIGN KEY ("seoImage") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Group" ADD CONSTRAINT "Group_author_fkey" FOREIGN KEY ("author") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_group_fkey" FOREIGN KEY ("group") REFERENCES "Group"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_seoImage_fkey" FOREIGN KEY ("seoImage") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_author_fkey" FOREIGN KEY ("author") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Customer" ADD CONSTRAINT "Customer_customerType_fkey" FOREIGN KEY ("customerType") REFERENCES "Structure"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Customer" ADD CONSTRAINT "Customer_subscription_fkey" FOREIGN KEY ("subscription") REFERENCES "Subscription"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Listing" ADD CONSTRAINT "Listing_store_fkey" FOREIGN KEY ("store") REFERENCES "Store"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Listing" ADD CONSTRAINT "Listing_listingType_fkey" FOREIGN KEY ("listingType") REFERENCES "Structure"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Listing" ADD CONSTRAINT "Listing_featuredImage_fkey" FOREIGN KEY ("featuredImage") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Listing" ADD CONSTRAINT "Listing_media_fkey" FOREIGN KEY ("media") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Listing" ADD CONSTRAINT "Listing_seoImage_fkey" FOREIGN KEY ("seoImage") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Listing" ADD CONSTRAINT "Listing_author_fkey" FOREIGN KEY ("author") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Store" ADD CONSTRAINT "Store_storeType_fkey" FOREIGN KEY ("storeType") REFERENCES "Structure"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Store" ADD CONSTRAINT "Store_featuredImage_fkey" FOREIGN KEY ("featuredImage") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Store" ADD CONSTRAINT "Store_media_fkey" FOREIGN KEY ("media") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Store" ADD CONSTRAINT "Store_seoImage_fkey" FOREIGN KEY ("seoImage") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Store" ADD CONSTRAINT "Store_author_fkey" FOREIGN KEY ("author") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Collection" ADD CONSTRAINT "Collection_author_fkey" FOREIGN KEY ("author") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_tagType_fkey" FOREIGN KEY ("tagType") REFERENCES "Structure"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tag" ADD CONSTRAINT "Tag_organizations_fkey" FOREIGN KEY ("organizations") REFERENCES "Organization"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Asset" ADD CONSTRAINT "Asset_author_fkey" FOREIGN KEY ("author") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_customer_fkey" FOREIGN KEY ("customer") REFERENCES "Customer"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_avatar_fkey" FOREIGN KEY ("avatar") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User" ADD CONSTRAINT "User_organizationMembers_fkey" FOREIGN KEY ("organizationMembers") REFERENCES "Organization"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organization" ADD CONSTRAINT "Organization_organizationType_fkey" FOREIGN KEY ("organizationType") REFERENCES "Structure"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organization" ADD CONSTRAINT "Organization_featuredImage_fkey" FOREIGN KEY ("featuredImage") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organization" ADD CONSTRAINT "Organization_seoImage_fkey" FOREIGN KEY ("seoImage") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organization" ADD CONSTRAINT "Organization_author_fkey" FOREIGN KEY ("author") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Global" ADD CONSTRAINT "Global_author_fkey" FOREIGN KEY ("author") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subscription" ADD CONSTRAINT "Subscription_subscriptionType_fkey" FOREIGN KEY ("subscriptionType") REFERENCES "Structure"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subscription" ADD CONSTRAINT "Subscription_featuredImage_fkey" FOREIGN KEY ("featuredImage") REFERENCES "Asset"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Subscription" ADD CONSTRAINT "Subscription_author_fkey" FOREIGN KEY ("author") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Setting" ADD CONSTRAINT "Setting_author_fkey" FOREIGN KEY ("author") REFERENCES "User"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Article_media" ADD FOREIGN KEY ("A") REFERENCES "Article"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Article_media" ADD FOREIGN KEY ("B") REFERENCES "Asset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Article_tags" ADD FOREIGN KEY ("A") REFERENCES "Article"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Article_tags" ADD FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Animal_media" ADD FOREIGN KEY ("A") REFERENCES "Animal"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Animal_media" ADD FOREIGN KEY ("B") REFERENCES "Asset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Event_vendors" ADD FOREIGN KEY ("A") REFERENCES "Event"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Event_vendors" ADD FOREIGN KEY ("B") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Event_tags" ADD FOREIGN KEY ("A") REFERENCES "Event"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Event_tags" ADD FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_tags" ADD FOREIGN KEY ("A") REFERENCES "Page"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Page_tags" ADD FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Group_members" ADD FOREIGN KEY ("A") REFERENCES "Group"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Group_members" ADD FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Group_moderators" ADD FOREIGN KEY ("A") REFERENCES "Group"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Group_moderators" ADD FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Group_tags" ADD FOREIGN KEY ("A") REFERENCES "Group"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Group_tags" ADD FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_tags" ADD FOREIGN KEY ("A") REFERENCES "Post"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Post_tags" ADD FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Listing_tags" ADD FOREIGN KEY ("A") REFERENCES "Listing"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Listing_tags" ADD FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Store_tags" ADD FOREIGN KEY ("A") REFERENCES "Store"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Store_tags" ADD FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Collection_tags" ADD FOREIGN KEY ("A") REFERENCES "Collection"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Collection_tags" ADD FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Tag_traits" ADD FOREIGN KEY ("A") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Tag_traits" ADD FOREIGN KEY ("B") REFERENCES "Trait"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Asset_tags" ADD FOREIGN KEY ("A") REFERENCES "Asset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Asset_tags" ADD FOREIGN KEY ("B") REFERENCES "Tag"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Trait_media" ADD FOREIGN KEY ("A") REFERENCES "Asset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Trait_media" ADD FOREIGN KEY ("B") REFERENCES "Trait"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Group_media" ADD FOREIGN KEY ("A") REFERENCES "Asset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Group_media" ADD FOREIGN KEY ("B") REFERENCES "Group"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Organization_media" ADD FOREIGN KEY ("A") REFERENCES "Asset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Organization_media" ADD FOREIGN KEY ("B") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Subscription_media" ADD FOREIGN KEY ("A") REFERENCES "Asset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Subscription_media" ADD FOREIGN KEY ("B") REFERENCES "Subscription"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Subscription_seoImage" ADD FOREIGN KEY ("A") REFERENCES "Asset"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Subscription_seoImage" ADD FOREIGN KEY ("B") REFERENCES "Subscription"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_User_followers" ADD FOREIGN KEY ("A") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_User_followers" ADD FOREIGN KEY ("B") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Organization_stores" ADD FOREIGN KEY ("A") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_Organization_stores" ADD FOREIGN KEY ("B") REFERENCES "Store"("id") ON DELETE CASCADE ON UPDATE CASCADE;
